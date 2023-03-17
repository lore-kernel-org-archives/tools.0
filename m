Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC920F8
	for <tools@linux.kernel.org>; Fri, 17 Mar 2023 10:21:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 4C87B5C0070
	for <tools@linux.kernel.org>; Fri, 17 Mar 2023 06:21:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 17 Mar 2023 06:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1679048476; x=1679134876; bh=gcPko0FhKU
	loxK2Rc9/P6F6JExmtaiarh1C8Lwi2EBo=; b=T+Kk9ugrKnNXKMcHVRlSEiG6W8
	Das8JNMgkAq3k7b3rHUXIaxWorWXfnsJmGWwT7XZr6G4nOIUpNsX/h9jyj1szgQe
	HFaxs8vR3yZ/6Ktm34plFI/0x3BhmdXmJbWmfaGVVhkXRo2xDvjDZgy4n2HLtMDZ
	lb9isI3/kJBxff3/jC6rpNuyJPihxqpyb0f0DORwJ+JhP2nIba2IjyhsSkZ8bbus
	mA19gC0E4rVPuSzIuX21FFY9kiJ51wfN/GV1xLoLnTO0AwpJFilCoULFuOhRqciK
	8XXLXaKjEieM9M2cIu4R8Hcc007gMk676hk1JIcXgJM+G77p5dHijGwjrHhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679048476; x=1679134876; bh=gcPko0FhKUlox
	K2Rc9/P6F6JExmtaiarh1C8Lwi2EBo=; b=KvIZyTYGZYtLVJiYSAAXKKi48i1L7
	Ok4Rj7F9uF4gTNp6K7qPVp6nT7IvTL1lgM2zCwVYC7dDb2F0NmClHdB4RwZrMNMt
	ERwgc5jEpnXJLFJHyvUvJCxmNqAdIb3ob04YF/umXLHeAdzPbpTKE0/lANTtcVuG
	X84nhJeWDrRYCBfhzGzRnQJyn5qFCIM3hBtDMT/CGEDTl4KdMt7pzfeE+z87nZQu
	EIEd2D8Q+1pjs/3f7iujR80xlQdOEZxbansUemo5m+ijcnIXSAXF+nHhD7hkDEKm
	S4LopQcbVNb9sOT7pNI0GkUmtP0rgjjwaYHjd7Op6xJTOlCuC5RyfgG5Q==
X-ME-Sender: <xms:HD8UZLd2tWnUHF1THmmbAEDAT1PMxgPLFPAnSiXRP7ur6FD2VeoLFA>
    <xme:HD8UZBMSlnWiaEz1jcoEykQwmKwt7gitvkxQMYRZGjUA8EfG8sOhNre1XyUsz0-pL
    ZHLScsAzP5-Dfmh7Q>
X-ME-Received: <xmr:HD8UZEgcBwA_7GR522Q11QLqtIlGqOSnssYr2uIXsc8fBfNDsyFhni_bklfnmwzM7pGdt-Fr9QsV-q6ipOsVX5wTk6-nucJp0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdrihhs
    qeenucggtffrrghtthgvrhhnpeehkefgtdevtedtkeduudeguefgudejheeugfelgeettd
    fhffduhfehudfhudeuhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehhihesrghlhihsshgrrdhish
X-ME-Proxy: <xmx:HD8UZM8msy2KIXnWYxMhZ6ScAK4O51tZ7xzhW_QTg6kHzNNQPyA_vg>
    <xmx:HD8UZHtEPe9RGXYDPme4GVRBP5jhSMNefi9veh5I3XDybd8zA6Stug>
    <xmx:HD8UZLFG5zRjrPuRokgXh8uf8uw9tSJX6BVHNvkB3R5kiV7fDExZoQ>
    <xmx:HD8UZE5UFTebQPgNZqw8HtHItISGF3xUFjIWw4STmpgBTkSDnHSjkA>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <tools@linux.kernel.org>; Fri, 17 Mar 2023 06:21:15 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
	id 8F426335; Fri, 17 Mar 2023 10:21:13 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: tools@linux.kernel.org
Cc: Alyssa Ross <hi@alyssa.is>
Subject: [PATCH] Fall back to EMAIL environment email
Date: Fri, 17 Mar 2023 10:21:07 +0000
Message-Id: <20230317102107.17422-1-hi@alyssa.is>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This matches git's behavior.  Without this change, b4 shazam would
catch the KeyError and exit 1 with no error message.  This will still
happen if EMAIL is also unset.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 b4/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/b4/__init__.py b/b4/__init__.py
index 94c1693..31d7672 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2579,6 +2579,8 @@ def get_user_config():
         if 'name' not in USER_CONFIG:
             udata = pwd.getpwuid(os.getuid())
             USER_CONFIG['name'] = udata.pw_gecos
+        if 'email' not in USER_CONFIG:
+            USER_CONFIG['email'] = os.environ['EMAIL']
     return USER_CONFIG
 
 
-- 
2.37.1

