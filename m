Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA032E414
	for <tools@linux.kernel.org>; Wed, 21 Jan 2026 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014046; cv=none; b=R5UxhQ2n7dDjacigtTcnhzwtnUG7sAQqB120CH6vgF5aeL7egLsp4IqgRSuy4BM8cFsJwna9+s9H8a3X0rTBy7aFEZVGdp17MhX1Km7xOuGMPWvtaINj7bgQBXHJ7fayq8VMOYF5Moge58gjT7k9JhLbcGNUi4xkBV7NAP+FmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014046; c=relaxed/simple;
	bh=26m3GT1zK5qTkfWVyKH1UNMbAVemr5w8HahFbY3ZLZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=rzcnSXCwBvJMxnuffREXAa+HGRUm6QbnRga9u+OTtAYHSBYNStjz6RGCDSkF7jcBxvssKI/Fcy6Pd7SiWqY7ubo5FHUDS5pkfkjkk6gyLtD4AM1Vm/v4nkHhIT1QSAl/6OaZrCpcTdVDNBlO4WkG2B6NZLzGPUnvO+JhuxkaJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BzbZyQVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BzbZyQVH"
Received: by smtp.kernel.org (Postfix)
	id 5AB78C4CEF1; Wed, 21 Jan 2026 16:47:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E615FC19424
	for <tools@kernel.org>; Wed, 21 Jan 2026 16:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E615FC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF1A0C21A8D;
	Wed, 21 Jan 2026 16:46:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 086976070A;
	Wed, 21 Jan 2026 16:47:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A426A119B1888;
	Wed, 21 Jan 2026 17:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769014041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KtlJWFbCaVh4s6A9IGCvj9tSbZ7YHsc+buK/tyVnsTU=;
	b=BzbZyQVHzCBhsCxwvYv3WpR1SiQt6V4JQQAujI0moRHjlOuAvZxKyXhx2047HqTNfGezBk
	4eHUbDQFn7F1A8C3UHf4GehIZofC8LD5CYSAAWf6yrDJdt5wa3Lkz3hrDB3VEohntUsamn
	Djw1bpuD3Kc4RDvxP5AGvJHiZc9qF5sfYiLLkUFmjumvZik5cjwR2OcdX2/WAK5nBSQilw
	ffIN1adRJYO9qU3DY5JwTDk2UFut78goLDX742v3BEYn1UralkrMUblJUtH49JAi/XTQxv
	ag1SdRAbBvIdP47SvrTy9yJ6uHRP/gbLX0ZKTdmcq+BUnSRcKcaZ3AiHL52lmQ==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 17:47:19 +0100
Message-Id: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
Subject: [BUG?] b4 shazam applies unrelated patches due to dfblob collision
 (b4 0.14.3)
Cc: <louis.chauvet@bootlin.org>, <thomas.petazzoni@bootlin.org>
To: <tools@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
X-Last-TLS-Session-Version: TLSv1.3

Hello b4 developers,

thanks for b4, it is great!

I have a problem (bug?) to report I'm afraid.

While trying to apply a 1-patch series, b4 shazam applied the correct
patch, but:

 - in the output, it listed 22 paches being applied, and none was the
   intended one
 - at the end the branch contained 8 new patches, the first one being the
   intended one
 - it did not pick up the R-by line for the intended patch

Patch and target branch details:

 - appliying on drm-misc-next from
   ssh://git@ssh.gitlab.freedesktop.org/drm/misc/kernel.git currently at
   commit 95d628c9e473 ("drm: rcar-du: lvds: convert to
   of_drm_find_and_get_bridge()")
 - applying the 1-patch seried at
   https://lore.kernel.org/all/20251231-drm-bridge-alloc-getput-drm_of_find=
_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com/

Full log follows.

----------------------8<----------------------
=E2=96=B6 b4 shazam  https://lore.kernel.org/all/20251231-drm-bridge-alloc-=
getput-drm_of_find_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com/
Grabbing thread from lore.kernel.org/all/20251231-drm-bridge-alloc-getput-d=
rm_of_find_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v6: 22 patches
  Added from v7: 23 patches
Analyzing 48 messages in the thread
Analyzing 48 code-review messages
Will use the latest revision: v7
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v7 1/22] drm/amd/display: Remove unnecessary SIGNAL_TYPE=
_HDMI_TYPE_A check
  =E2=9C=93 [PATCH v7 2/22] drm: Add new general DRM property "color format=
"
  =E2=9C=93 [PATCH v7 3/22] drm: Add enum conversions between DRM_COLOR_FOR=
MAT and HDMI_COLORSPACE
  =E2=9C=93 [PATCH v7 4/22] drm/bridge: Act on the DRM color format propert=
y
  =E2=9C=93 [PATCH v7 5/22] drm/display: hdmi-state-helper: Act on color fo=
rmat DRM property
  =E2=9C=93 [PATCH v7 6/22] drm/display: hdmi-state-helper: Try subsampling=
 in mode_valid
  =E2=9C=93 [PATCH v7 7/22] drm/i915: Implement the "color format" DRM prop=
erty
  =E2=9C=93 [PATCH v7 8/22] drm/amdgpu: Implement "color format" DRM proper=
ty
  =E2=9C=93 [PATCH v7 9/22] drm/rockchip: Add YUV422 output mode constants =
for VOP2
  =E2=9C=93 [PATCH v7 10/22] drm/rockchip: vop2: Fix YUV444 output
  =E2=9C=93 [PATCH v7 11/22] drm/rockchip: vop2: Add RK3576 to the RG swap =
special case
  =E2=9C=93 [PATCH v7 12/22] drm/rockchip: vop2: Recognise 10/12-bit YUV422=
 as YUV formats
  =E2=9C=93 [PATCH v7 13/22] drm/rockchip: vop2: Set correct output format =
for RK3576 YUV422
  =E2=9C=93 [PATCH v7 14/22] drm/bridge: dw-hdmi-qp: Implement atomic_get_o=
utput_bus_fmts
  =E2=9C=93 [PATCH v7 15/22] drm/rockchip: dw_hdmi_qp: Implement "color for=
mat" DRM property
  =E2=9C=93 [PATCH v7 16/22] drm/rockchip: dw_hdmi_qp: Set supported_format=
s platdata
  =E2=9C=93 [PATCH v7 17/22] drm/connector: Register color format property =
on HDMI connectors
    + Reviewed-by: Maxime Ripard <mripard@kernel.org> (=E2=9C=93 DKIM/kerne=
l.org)
  =E2=9C=93 [PATCH v7 18/22] drm/tests: hdmi: Add tests for the color_forma=
t property
  =E2=9C=93 [PATCH v7 19/22] drm/tests: hdmi: Add tests for HDMI helper's m=
ode_valid
  =E2=9C=93 [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute =
to EDID definitions
  =E2=9C=93 [PATCH v7 21/22] drm/tests: bridge: Add KUnit tests for bridge =
chain format selection
  =E2=9C=93 [PATCH v7 22/22] drm/bridge: Document bridge chain format selec=
tion
  ---
  =E2=9C=93 Signed: DKIM/collabora.com
---
Total patches: 22
---
 Base: using specified base-commit dc0b90be8d513256a6594095731a702287f29602
 Deps: looking for dependencies matching 1 patch-ids
Grabbing search results from lore.kernel.org
 Deps: Applying prerequisite patch: [PATCH] drm/bridge: fix kdoc syntax
Applying: drm/bridge: fix kdoc syntax
Applying: drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
Applying: drm: Add new general DRM property "color format"
Applying: drm: Add enum conversions between DRM_COLOR_FORMAT and HDMI_COLOR=
SPACE
Applying: drm/bridge: Act on the DRM color format property
Applying: drm/display: hdmi-state-helper: Act on color format DRM property
Applying: drm/display: hdmi-state-helper: Try subsampling in mode_valid
Applying: drm/i915: Implement the "color format" DRM property
Applying: drm/amdgpu: Implement "color format" DRM property
Patch failed at 0009 drm/amdgpu: Implement "color format" DRM property
error: sha1 information is lacking or useless (drivers/gpu/drm/amd/display/=
amdgpu_dm/amdgpu_dm.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"
=E2=96=B6 git log --oneline  drm-misc/drm-misc-next..
38ebb10f2b83 (HEAD -> drm-misc-next) drm/i915: Implement the "color format"=
 DRM property
01a8c2dc91e0 drm/display: hdmi-state-helper: Try subsampling in mode_valid
50fdbeeed537 drm/display: hdmi-state-helper: Act on color format DRM proper=
ty
9cb7ad4f0a10 drm/bridge: Act on the DRM color format property
280fd2cb4aa5 drm: Add enum conversions between DRM_COLOR_FORMAT and HDMI_CO=
LORSPACE
7f731f50bf3d drm: Add new general DRM property "color format"
6e173053fa5c drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A ch=
eck
7a4637bce4f6 drm/bridge: fix kdoc syntax
=E2=96=B6
----------------------8<----------------------

Clue: my colleague Louis found that both the intended patch and some in the
other thread that got applied match the 'dfblob:6dcf8f6d3ec' query on
lore. Maybe the query needs to become more restrictive?

Workaround: I managed to apply the patch 100% correctly by adding the '-v1'
flag to b4. Luckily the other patches matching 'dfblob:6dcf8f6d3ec' are at
different versions. This workaround would not work otherwise, so it is not
really generic.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
