class TickercontentController < ActionController::Base

def index
  @tickercontent = Ticker.find(:all)
end

end