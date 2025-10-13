Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F9225401
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394019; cv=none; b=Z3hCFssFBV//++e426i5Jd5VaCBNlPJnnFA0AlKaPwxgyn9a0Lv84xuvwsphT/Un1yuL+IoMdiyIAZgTcsDT/PDc5FSGSN1n7ZezdEBmFqQJz2XuFUM/uct1PC5U3jniRc31jwHRjiILawXQN5Rl4CAyQwC93sAYMNYNZ/MLhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394019; c=relaxed/simple;
	bh=b8qBgDH2FkMfvHfBczehkmqw0nEe+ifliLWD8qM0O0Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tGtkmTPFe1E6aXA2NP+qnCLfJjiP+QcZdoRHEVflmkoV3VUhrzfgDxHI/hzM2O9kwxJr3WJxFf9oeRq4KisJRsVpnJOWWkuU4yuqJv0j7sZa1ZBvWAsPaaKMDPdcVgMQFVkbm3A+GEGkKEgYg0SeixjhIjLR7ZB7PCzrXOKoV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=he6XG9NV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="he6XG9NV"
Received: by smtp.kernel.org (Postfix)
	id B90B7C4CEFE; Mon, 13 Oct 2025 22:20:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88DA4C4CEE7
	for <tools@kernel.org>; Mon, 13 Oct 2025 22:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88DA4C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760394016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D/698pfs2pA/hKR/I0MF+4k25YSXkTe1jFXEn3qVmOY=;
	b=he6XG9NVybDsUYAbBVCkmTLmOJi/0k5v2DwjrzP86h6FECuLfq8ndwEuabGVyRlqO24yBm
	XOAniQ825jhqPwVUPNpuxON0VIn+dcjHEx9EF9rrI0xbKlvMCu+cxhl68itcx9SvymTUfb
	UNPT+Xs/URFnZ6w7hKXDLe2RVbSsURw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-2DKRAIOiObaCoVNzXONJ5w-1; Mon, 13 Oct 2025 18:20:15 -0400
X-MC-Unique: 2DKRAIOiObaCoVNzXONJ5w-1
X-Mimecast-MFC-AGG-ID: 2DKRAIOiObaCoVNzXONJ5w_1760394014
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso3694131f8f.1
        for <tools@kernel.org>; Mon, 13 Oct 2025 15:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394014; x=1760998814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/698pfs2pA/hKR/I0MF+4k25YSXkTe1jFXEn3qVmOY=;
        b=VUaMgPqz39Roej3pDXtaKErnGnxH/LB3O+U4tmUDBx9qEIJNtkI9Mk024kgnnX8OA4
         WF+EJ1Ukdfl7A8M43y+BahZrS1gnwpN8pieLh03iCh4TmSEwBWfQ5Nh58wBsNmReKKeW
         44yOTFEEH7+oaRymn19Lrj7d4slMPKR3NQICs7Wjxk/eXCjT9/U3fLhVnC/UErruUxNB
         nRgUgKSGX3VmdkxZMW1oFsvVW/v7sdnwWXhNN9o1RRn0JMPz252ticlOEY7IxjGlOs42
         nnnGO3EbnBjZg3OE76B5SEFb1/tlfOln9livKedUCZdBFeFebqIF/DN/d6kDkgaZZGHP
         J0Zg==
X-Gm-Message-State: AOJu0YwJQa06r50oSXrpg7d1uqqxB5Chh4Il/oVLyOtOW4/VGqjBshfE
	kSjFCXDgdBmgSbHDc9CEEKuu194aZxR+uTLupHvARiOJFbuTstSuDkojH8E2JUkZHIKKcKDmsBs
	ujXpofn6XQ+BmSHD2UlTovmhFc5VVmUEnOnSnuT6fBC/y3VY97p/TSp4sV6UUtd/3nAq957OPZu
	wlC335MaLCB5/6un9u7v0sCCB0i73jLQ==
X-Gm-Gg: ASbGncsTd7Uv0Cm41Zkck4UGBqHG7TjivAViPB7XWiTW5Tyj6JRFrTr3ScEH5taVF5j
	2wT4I+TiyIi3tp1huzpUVk5BEzRPZPEAwsXDbIjVPuALcR5t1HKpq62o9FxNUBSDmIm6SlVi6av
	SrJozazEhAWrSp2RsBJWYw2j02AA9OoGKCYRsHKZiPSTYFlD2WnCH+wwHf/y6z2O3vOtM0uidiP
	MsgINsW4Ve7Gur6cwTd1WOJEauhXQlmiZ7M5QP4u7NyYg9EIO+Hwdh6PC3bZUIcX09nbFsFFuc2
	0K71jFCg5ccrSpiAqU6EhL3Pf/zoAodk9A==
X-Received: by 2002:a05:6000:4285:b0:3ee:13b1:d70e with SMTP id ffacd0b85a97d-4266e7e142dmr14421019f8f.40.1760394013951;
        Mon, 13 Oct 2025 15:20:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYbmfA451vJ5J2RbUPp7ZKWvO7OUIpBtxLczuxRQd/1nUa4hlaKjwzMe2XjS4kuUMURsBKZQ==
X-Received: by 2002:a05:6000:4285:b0:3ee:13b1:d70e with SMTP id ffacd0b85a97d-4266e7e142dmr14421001f8f.40.1760394013426;
        Mon, 13 Oct 2025 15:20:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm19636450f8f.27.2025.10.13.15.20.12
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 15:20:12 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:20:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Subject: [PATCH 2/2] ez: cleanup sparse-checkout usage
Message-ID: <d848c9ab8f99d02a1820bd28905bb1d53e5f2b73.1760393880.git.mst@redhat.com>
References: <cover.1760393880.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1760393880.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JaY50Qx6GSxOc8glYqOXtetS3qgE9ShGJVQpKCF3cn4_1760394014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Similarly to the previus patch, b4 ez uses sparse-checkout incorrectly:
- it does not want any files but it uses "init" which
  actually gives some files (the ones in the root)
- it runs checkout but it's pointless - index is left dirty,
  and it only happens to work because cherry-pick works
  with a dirty index (unlike e.g. am).

To fix, switch to sparse-checkout set to get an empty cone +
checkout -f to update the index.

We could actually skip checkout completely but it seems better
not to rely on the quirk of cherry-pick that allows it to
work with a dirty index, and an empty index is quick to update.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 src/b4/ez.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 26772b4..4510be2 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2386,12 +2386,12 @@ def reroll(mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PR
                 base_commit, start_commit, end_commit = get_series_range(usebranch=mybranch)
                 with b4.git_temp_worktree(topdir, base_commit) as gwt:
                     logger.debug('Preparing a sparse worktree')
-                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'init'], logstderr=True)
+                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'set'], logstderr=True)
                     if ecode > 0:
-                        logger.critical('Error running sparse-checkout init')
+                        logger.critical('Error running sparse-checkout set')
                         logger.critical(out)
                         raise RuntimeError
-                    ecode, out = b4.git_run_command(gwt, ['checkout'], logstderr=True)
+                    ecode, out = b4.git_run_command(gwt, ['checkout', '-f'], logstderr=True)
                     if ecode > 0:
                         logger.critical('Error running checkout into sparse workdir')
                         logger.critical(out)
-- 
MST

