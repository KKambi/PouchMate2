class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0 

    setup: -> 
        $("[data-behavior='notifications-link']").on "click", @handleClick

        $.ajax(
            url: "/notifications.json"
            dataType: "JSON"
            method: "GET"
            success: @handleSuccess
        )

   


    handleSuccess: (data) =>
        items = data.map (notification) ->
            "<li><a class='dropdown-content' href='#{notification.url}'>'#{notification.actor} #{notification.action}#{notification.notifiable.type}'</a></li>"

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='dropdown-item']").html(items)



jQuery ->
    new Notifications 