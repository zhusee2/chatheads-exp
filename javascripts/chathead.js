(function() {
  var chatview, _ref;

  if ((_ref = window.Chathead) == null) {
    window.Chathead = {};
  }

  Chathead.ChatView = (function() {
    function ChatView(container) {
      this.container = $(container);
      if (this.container.length < 1) {
        return false;
      }
      this.bindEvents();
    }

    ChatView.prototype.bindEvents = function() {
      var _this = this;

      return this.container.on("click.chathead", function(event) {
        if (_this.isCollapsed()) {
          return _this._collapsedViewClickHandler(event);
        } else {
          return _this._expandedViewClickHandler(event);
        }
      });
    };

    ChatView.prototype.isCollapsed = function() {
      return this.container.hasClass("collapsed");
    };

    ChatView.prototype.isExpanded = function() {
      return this.container.hasClass("expanded");
    };

    ChatView.prototype.collapse = function() {
      this.container.addClass("collapsed");
      this.container.removeClass("expanded");
      return this.resetAllHeadsPosition();
    };

    ChatView.prototype.close = function() {
      return this.collapse();
    };

    ChatView.prototype.expand = function() {
      this.container.addClass("expanded");
      this.container.removeClass("collapsed");
      return this.calcAndSetHeadsPosition();
    };

    ChatView.prototype.getHeads = function() {
      return this.container.find(".ch-head");
    };

    ChatView.prototype.calcAndSetHeadsPosition = function() {
      var $heads;

      $heads = this.getHeads();
      return $heads.each(function(index, head) {
        var rightValue;

        rightValue = ($heads.length - index - 1) * 80;
        return $(head).css("right", "" + rightValue + "px");
      });
    };

    ChatView.prototype.resetAllHeadsPosition = function() {
      var $heads;

      $heads = this.getHeads();
      return $heads.css("right", "");
    };

    ChatView.prototype._collapsedViewClickHandler = function(event) {
      this.expand();
      return event.preventDefault();
    };

    ChatView.prototype._expandedViewClickHandler = function(event) {
      this.collapse();
      return event.preventDefault();
    };

    return ChatView;

  })();

  chatview = new Chathead.ChatView("ul.ch-head-list");

}).call(this);
