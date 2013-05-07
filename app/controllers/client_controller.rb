class ClientController < ApplicationController

  def serve
    Rails.logger.debug params[:asset]
    render file: File.join(Rails.root, 'app', 'client', params[:asset]),
          status: 200, "content-type" => "text/javascript"
  end

  def serve_bower
    Rails.logger.debug params[:asset]

    path = Dir[File.join(Rails.root, 'components', '*', '*')].find do |asset|
      asset.split('/').include? params[:asset]
    end
    type = Mime[File.extname(path)[1..-1]]

    if type.to_s.start_with? "image"
      render text: open(path, "b")
    else
      render file: path, status: 200, "content-type" => type
    end
  end

end
