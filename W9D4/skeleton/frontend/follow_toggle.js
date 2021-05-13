class FollowToggle {

  constructor(el){
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render()
  }

  render(){
    if(this.followState === false){
      this.$el.text("Follow!")
    } else {
      this.$el.text("Unfollow!")
    }
  }

  handleClick(){
    const followToggle = (followState) => {
      this.followState = followState;
      this.render();
    };
  
  
    this.$el.on("click", (e) => {

    e.preventDefault();
    $.ajax ({
      type: 'POST',
      url: `/users/${this.userId}/follow`,
      // data: {

      // }
      success(data) {
        console.log("Did thing")
        console.log(data)
      },
      error() {
        console.error("did not thing")
      },

    });
}

$form.on('submit', (e) => {
  e.preventDefault(); // have to prevent the default form submission request
  const value = $inputEl.val();
  const $newBucketListItem = $("<li
	class= 'single-bucket' ></li > ");
	$newBucketListItem.text(value);
  $bucketList.append($newBucketListItem);
  $inputEl.val(''); // will make it empty
  $pEl.text('');
})

module.exports = FollowToggle