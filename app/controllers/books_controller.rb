class BooksController < ApplicationController
  helper_method :sort_column, :sort_direction
  #before_filter :authenticate_user!
  # GET /books
  # GET /books.json
  def index
    #@books = Book.all
    #get current user_id
    user_id=  User.find(current_user.id)
    #@books = Book.search(params[:search])
    # check if the user has any books
    books = Book.find_by_user_id(current_user.id)
    if books.nil?
      # if not redirect
      redirect_to "/books/new"
    else
      @books = @current_user.books
      @count  = @current_user.books.count

      #http://railscasts.com/episodes/240-search-sort-paginate-with-ajax?autoplay=true
      @books = @books.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @books }
      end
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show

    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new

    @user = User.find(current_user.id)
    @book = Book.new
    @book.user_id = @user.id

    @book = Book.new(:title => params[:rtitle],:author => params[:rauthor], :isbn => params[:risbn])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    #   @book = Book.new(params[:book])

    @user = User.find(current_user.id)
    @book = Book.new(params[:book])
    @book.user_id = @user.id

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    #@book = Book.find(params[:id])
    @book = current_user.books.find(params[:id])
    book2delete = @book.title
    @book.destroy
    flash[:notice] = "Removed: #{book2delete}"
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def searchbook

    #   value = params[:select]
    #   if value == 'Title'
    @input = params[:booksearch]
    @results = Findbook.bookfinder(@input)
  #     elsif value == 'Author'
  #     @input = params[:searchbook]
  #     @results = Findbook.authorfinder(@input)
  #   else
  #     @input = params[:searchbook]
  #     @results = Findbook.bookfinder(@input)
  #   end
  end

  private

  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
