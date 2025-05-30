<!-- SPDX-License-Identifier: GPL-2.0-or-later -->

<!DOCTYPE html>
{% include "html" %}
<head>
	{% include "meta" %}
	<link rel="preload" href="assets/scripts/live.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/libs/common.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/components/optionsMenu.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/components/feed.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/components/streamer.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/vendor/hls.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/libs/time.js" as="script" crossorigin />
	<link rel="preload" href="assets/scripts/components/modal.js" as="script" crossorigin />
	<script type="module" defer>
		import { init } from "./assets/scripts/live.js";
		init();
	</script>
</head>
<body>
	{% include "sidebar" %}
	<div id="content">
		<div id="content-grid-wrapper">
			<div id="content-grid"></div>
		</div>
	</div>
</body>

<style>
	#nav-link-live {
		background: var(--color1-hover);
	}
</style>
{% include "html2" %}
