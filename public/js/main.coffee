class Population

    constructor: () ->

        @initialPopulation = null
        @currentPopulation = null
        @wantedDate = null
        @wantedTimestamp = null

        @handlerList = 
            'compute': $('.app-compute')
            'wantedDate': $('.app-wantedDate')
            'wantedPopulation': $('.app-wantedPopulation')
            'currentPopulation': $('.app-currentPopulation')

        @handlerList['compute'].click( (e) =>
            e.preventDefault()
            wantedPopulation = @getWantedPopulation(@wantedTimestamp)
            @handlerList['wantedPopulation'].html(wantedPopulation)
        )

    setWantedDate: (@wantedDate) ->
        @wantedTimestamp = @wantedDate.getTime()/1000
        @handlerList['wantedDate'].html(@displayDate(@wantedTimestamp))
        @


    getPopulation: ->
        
        $.getJSON('/population', (data) =>
            @currentPopulation = data
            if @initialPopulation == null
                @initialPopulation = @currentPopulation
            @handlerList['currentPopulation'].html(@currentPopulation['population'])
            callback = => @getPopulation()
            setTimeout callback, 5000
        )

    getWantedPopulation: (wantedTimestamp) ->
        
        if @initialPopulation != null && @currentPopulation != null
            t1 = @initialPopulation['timestamp']
            t2 = @currentPopulation['timestamp']
            p1 = @initialPopulation['population']
            p2 = @currentPopulation['population']
            growth = (p2-p1) / (t2-t1)
            wantedPopulation = Math.floor(p1 + ( (wantedTimestamp-t1) * growth))
            console.log( 'Population increase of ' + (p2-p1) + ' people in ' + (t2-t1) )
            console.log( 'Growth is ' + growth)
            console.log( 'Population should be ' + wantedPopulation + '(+' + (wantedPopulation - p1) + ') in ' + (wantedTimestamp-t1) + ' seconds')
        return wantedPopulation

    displayDate: (timestamp) ->
        
        date = new Date(timestamp*1000)

        day = if date.getDate() < 10 then '0' + date.getDate() else date.getDate()
        month = if date.getMonth() + 1  < 10 then '0' + date.getMonth() + 1 else date.getMonth()
        year = date.getFullYear()
        hour = if date.getHours() < 10 then '0' + date.getHours() else date.getHours()
        minute = if date.getMinutes() < 10 then '0' + date.getMinutes() else date.getMinutes()
        second = if date.getSeconds() < 10 then '0' + date.getSeconds() else date.getSeconds()

        dislayDate =  "#{day}/#{month}/#{year} #{hour}:#{minute}:#{second}" 

$ ->
    population = new Population()
    population.getPopulation()
    population.setWantedDate(new Date(2012,11,17,12,0,0))