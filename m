Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AA212194
	for <tools@linux.kernel.org>; Tue, 12 Nov 2024 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406845; cv=none; b=LYFyaEIvAQygmSWBLJBYaBpzlWKc12a1cJBmETduzZgdAtYKBLxi/aas4FZuyXWfPKS/NuRSrgcMHevA3GS7srsS/YNOxo3e3K+Fde6a+p1aL8+GJswRKFLYyCvBgUFMlEePtb7ZNtVGIsom58JZZix5PjZwHQEhA121Em1xgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406845; c=relaxed/simple;
	bh=r6wr4f0ZlALoWyKV8ynxPsKolxK69y/wgyyovzppPdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gDjZgbK//58/mtRRLbcynJ5TOKYAgYLH41ncx3FX3NvYKVPKkTnEctrG9fCkzuxR9EsMmyAc40XbMi5ZM+k48BcjYHuy4Xu0P0jAHJmj0tbJumTuS6uPq1Fh7G/axS0+pnxn8Tk2ojXAUlktDnAanY0Efyfp7yOe4CURNJTxHOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pks.im header.i=@pks.im header.b=q0BP57dv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jlc2WUId; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pks.im header.i=@pks.im header.b="q0BP57dv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jlc2WUId"
Received: by smtp.kernel.org (Postfix)
	id C6074C4CED4; Tue, 12 Nov 2024 10:20:44 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4598CC4CED6
	for <tools@kernel.org>; Tue, 12 Nov 2024 10:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4598CC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=pks.im
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pks.im
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 544931140210;
	Tue, 12 Nov 2024 05:20:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 12 Nov 2024 05:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pks.im; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1731406842; x=1731493242; bh=LmWn2bgjjt
	YG+Z6NXGTqTZ6p8q4pakz1ITT9lSx7pMg=; b=q0BP57dvGtiqvH+7QdZ1MaD3r/
	FOUek4dhdTvYdCevslGQ0irNgSHy92djktWqqAbfDPEjRfkNL4cyP0U+UfBbvZDD
	9QMklEhrm66qxArTwaTB1KiWlvZMfqRX5es/CcAfhJKKoeYyB3XcLruJ2vn2jGIq
	pQVsqoVgZV7Z49tJBhK63N9ep1ztlU9SLHasnI2VcsxP6TfyMWkmvWWQ4yl7Tof+
	l5/fQhr+e9jQnb/I1G7pC6HpTIm/s9/u7qrKOTPjHG8a4/iDgul3cLKfHF2hJK/V
	kVsQd+DXfk/QuxTrkiP4g3tovB2EvxR/ySxb3VeuLg8DfHvORV5vCuXMj/yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1731406842; x=1731493242; bh=LmWn2bgjjtYG+Z6NXGTqTZ6p8q4p
	akz1ITT9lSx7pMg=; b=Jlc2WUId6MrfXabWhnzEwR5eu9zuuFiP9YImmZrhWWoc
	J3lUU0w61TSr/1N8M8yUc9ZQMY3UcM1rV3Bg2AJKt61iBKQOnNbMlHNbMYbHB2m5
	Fd4vqPTzmKD0quZ/BJZG2ZkF+hYZoyPAacD0b3UlRlOc8AE0t+BrQUQnoa2eviKL
	zfYyWOaKztpizEiCrmXr5x1zgL8GTR6ZTTgT2X6019XVCnPJw6R+tCTfSlgBpX/F
	XkrVG+hTjo87VhJZOO8THxc9VAxjbWZoFBO5wkSHTHr4LxUDJV5DvhzcNJrMSJ7s
	ht6nkbwcQu60RzPQwj0ARIPWrNn3b78w3OUnId8Wgg==
X-ME-Sender: <xms:-iszZ4woP6oTvT4BYNtiZmE80HjvKc2YxB1lT80eDJBeICIHwjQ1mw>
    <xme:-iszZ8QnWEy3Cn08xyX4ZmHlVzkmMh-kKCZq6taRw10gUVk56ezYKLj9jNp4Ndxlg
    pXqmoV3rgqu3TiLaw>
X-ME-Received: <xmr:-iszZ6VeU03811sBHOgY2OH4gGCB_-tEuMCaj67Rrhbas-5C-qqyA5w5OSzdKvnqfxfgbudIEnSWHMD14uRS7RAJnbKSKcLS0FEdIopbrrv6lPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfh
    rhhomheprfgrthhrihgtkhcuufhtvghinhhhrghrughtuceophhssehpkhhsrdhimheqne
    cuggftrfgrthhtvghrnhepiefgiedtffffvddvueehheejheehleduudfhheekkeeggefg
    ueffheevgeetjeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepphhssehpkhhsrdhimhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:-iszZ2j2hm7vIPQlaSLmSUOgn2k2TYcWUwfvSkXZfLShQJZ57SRd9Q>
    <xmx:-iszZ6Ae_OTPMwK-LNhC1XK-prjTzd7Wy7kENfZytwCs3gRP41Ix7Q>
    <xmx:-iszZ3JmQ3-rtLnyc27I_gjda0CEUEMXcQU0O89Vro9i7DaAg08K7Q>
    <xmx:-iszZxCccn1Y4MMBzki4ENRF-pa-H88VZWsJEvpOGdv8LecjMC_aTw>
    <xmx:-iszZ9NfcKUas1QaVTcrgGzNn36dFRWPUZJQb11rDf5ocRL6lJgv0gkz>
Feedback-ID: i197146af:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 05:20:41 -0500 (EST)
Received: 
	by vm-mail (OpenSMTPD) with ESMTPSA id fdf6bfbb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 12 Nov 2024 10:20:02 +0000 (UTC)
From: Patrick Steinhardt <ps@pks.im>
Date: Tue, 12 Nov 2024 11:20:28 +0100
Subject: [PATCH b4] ez: support shallow threads in "b4.send-same-thread"
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-pks-shallow-threads-v1-1-79466a503075@pks.im>
X-B4-Tracking: v=1; b=H4sIAOsrM2cC/x3MQQ5AMBBA0avIrE3SFiGuIhatDp0QpCNIxN01l
 m/x/wNCkUmgzR6IdLLwtiboPIMh2HUiZJ8MRplSa21wnwUl2GXZLjxCJOsFG6+UG+tiqCsDqdw
 jjXz/1w5cCf37ftD5Zv1pAAAA
X-Change-ID: 20241112-pks-shallow-threads-8d00bf73c752
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Patrick Steinhardt <ps@pks.im>
X-Mailer: b4 0.14.2

When setting "b4.send-same-thread" to a truish value, B4 will send
revised versions of a patch series in the same thread. This is done by
setting the "In-Reply-To" header to the message ID of the cover letter
of the preceding version. This leads to "deep" nesting, where the nth
version of a series will be nested n-1 levels below the first version.

But not all projects prefer deep nesting. The alternative that is used
in some projects is "shallow" nesting: instead of nesting the rerolled
version under the preceding version's cover letter, it gets nested under
the first version's cover letter.

Implement support for a new "shallow" value for "b4.send-same-thread"
that does exactly this.

Signed-off-by: Patrick Steinhardt <ps@pks.im>
---
I've recently started to experiment with B4 in the context of the Git
mailing list. Most folks over there don't use deep nesting for patch
series and instead prefer to shallowly nest patch series, which is what
this patch implements.
---
 docs/config.rst | 10 ++++++++--
 src/b4/ez.py    |  7 +++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index da58534a2ee24c453bee979f02949999069d8bc9..97271d663901bdca59ecfc26d88fa3d9e38ff1fe 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -398,8 +398,14 @@ Contributor-oriented settings
 
 ``b4.send-same-thread`` (v0.13+)
   When sending a new version of a series, send it in the same thread as
-  the previous version. B4 sends the first message of the new series as
-  a reply to the previous version's cover letter.
+  the previous version. The config supports the following values:
+
+  * ``yes``, ``true``, ``y``: B4 sends the first message of the new series as a
+    reply to the previous version's cover letter.
+  * ``shallow``: B4 sends the first message of the new series as a reply to the
+    first version's cover letter.
+  * ``no``: B4 does not send the new version of the series in the same thread
+    as any previous version.
 
   Default: ``no``
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 970631592d2139b12ee4a6a9a112081eee1de721..3424c34e93361a432c5dc350a135e06ebf0fe0bc 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1594,9 +1594,12 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     # Add X-Change-ID header
     patches[0][1].add_header('X-Change-ID', change_id)
 
-    samethread = config.get('send-same-thread', '').lower() in {'yes', 'true', 'y'}
-    if samethread and revision > 1:
+    samethread = config.get('send-same-thread', '').lower()
+    if samethread in {'yes', 'true', 'y', 'shallow'} and revision > 1:
         oldrev = revision - 1
+        if samethread == 'shallow':
+            oldrev = 1
+
         voldrev = f'v{oldrev}'
         try:
             oldmsgid = tracking['series']['history'][voldrev][-1]

---
base-commit: 355e82083f0eba59abf31521977dda09fab8bff5
change-id: 20241112-pks-shallow-threads-8d00bf73c752

Best regards,
-- 
Patrick Steinhardt <ps@pks.im>

