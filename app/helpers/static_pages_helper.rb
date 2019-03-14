module StaticPagesHelper
  def full_title(page_title = "")
    base_title = "WELearn - Học online mọi lúc"
    page_title.empty? ? (base_title) : (page_title + " - " + base_title)
  end
end
