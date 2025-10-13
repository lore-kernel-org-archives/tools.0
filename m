Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678012E7F22
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394014; cv=none; b=P0z9qWZU9RM5kFQqGRtJLWRySyVVF18GpL+h/FZPXfpVZWBmDIsyf+LrvOsbbChAOz6bicd67aHIx4K/BxDyqrd/Hxz8EUuVdmm2S1coPzLzCrFkOyAO7FNcuB3pQyDfDRvUMbWqVgS7kLmAD+yRQ1UHXoz5TlwIeXW9KHA3Qis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394014; c=relaxed/simple;
	bh=QX0ebSQz3KNIvIArpsjhkPFU1ltTHrOE3iy+1UdD0+E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h2ue/f1zmxPrjGkNm51iWGrbcovk2OYLkI5u4LzqI2jgSg8R08grJgWamm8sh5nX+dt3hAS+++aTP3vxnztp8ZOQk8IZdu/Tv+3YCOSDtIuhc7DMai4nnoi07wb2t6L9UGea3GK8Nwhnj2WIIh+SHZcM0cRUt3lK4aeuYSJqYfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJAaPelf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJAaPelf"
Received: by smtp.kernel.org (Postfix)
	id 188A0C116C6; Mon, 13 Oct 2025 22:20:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1F81C4CEFE
	for <tools@kernel.org>; Mon, 13 Oct 2025 22:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1F81C4CEFE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760394011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6MvVPyYhS8SvVVEZRoRdxaaN114XWv7WonDLt+GMtxM=;
	b=bJAaPelfKJP6VkS1GWHdAH0grxfXw227WxG6X6XrORGBdkqj99JvH61jpjq+JiS0VvPyfC
	GRJTd20vc/lhmsdUf+F7+k3qPPnH+It0O2Q39ImtL0qPlaz5rWoG5OJPmaMUPxPplhE8xX
	dCqZzEfZatlG3kPAiGF4l5h1C5WzgMA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-ur8rr_pZM9-FAAjIlLE9sw-1; Mon, 13 Oct 2025 18:20:10 -0400
X-MC-Unique: ur8rr_pZM9-FAAjIlLE9sw-1
X-Mimecast-MFC-AGG-ID: ur8rr_pZM9-FAAjIlLE9sw_1760394009
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso29596845e9.0
        for <tools@kernel.org>; Mon, 13 Oct 2025 15:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394009; x=1760998809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MvVPyYhS8SvVVEZRoRdxaaN114XWv7WonDLt+GMtxM=;
        b=VY0QLWMHikHtnoe+R5hRfbOS8tg7v2RxAFbjsZAbLZRXg1eSQ19csC2TDuivVDlkw3
         nsA1eopahHJiFRRyvPJRskEqpIUKNFreJeMPCmeHH6Nit8aFIQ8GpNV6ZfDCaaUmeFKB
         lWNIhpLHumbgybQBM6uHIkqTHAJhIIwY905AoBiYUmFwrIuETDE5d0W4rXRk+WAszQsF
         oURjrmHsM5x6kKRajtywjb+n2O+6jxVlxqXZaehW3g981gdBoGjyTvVhm09wD/SAGGMZ
         ZV5k44nGKnM9SrRunM1ejWp9PhaLoZDrAgDE6u7Y0jAFanlBaLtS1eN4JvcoYeKAL8eO
         ex8w==
X-Gm-Message-State: AOJu0YyyFuj8YxG8jB5C1O4UgCsNl9e/A5IzahLkUmNacqH9BDBx2ttB
	0a6ovqcrzHjXe9ds2kijKp/zjSAJQaW1B5ZYRWv0PlfIz14cmCLDuekeI9PT17F20pVlH7bKlQh
	4VKk7G8NFTEjrfW51LHRcf0P+w5D3xPSPnrlfAQJ/EYdipwpKrQdjI/TkxZsaFOu4fo1Eb/PXix
	0V/D166QQbcs5nvOhkrm+DhqL0R0BRAA==
X-Gm-Gg: ASbGncuT1Q467GG3SP9NY3gqFhh/CN0FFwfmT6dUSDXaRW4SysUanHA0DN7A8oNJDCz
	PS13ORSIj7a/GtBzRltppc7SaVv/rqNyh/q6jt6nbyzm/xrtQrw550krhzL7XkoOBJUqRFrw9rs
	s/qcRijBa5FTmSA0C6GUbQr6xwF7yA4OZh2UKkJbzSWKQoRRI6Aa742r99iBitvRHbsJxv5rb6+
	EMbqz3pYLNenJSXKwhjLmdUJuqvb0aMwv/LlKjpIxW/AN+A+Qr3V3/i0WVOPKWWVvFWTP6G+tj8
	0Cxw1wP0o+D0s+n++0aQqd47VEyteH7a+A==
X-Received: by 2002:a05:600c:64c3:b0:46f:d682:2cb0 with SMTP id 5b1f17b1804b1-46fd6822fa2mr2234265e9.21.1760394008581;
        Mon, 13 Oct 2025 15:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBn6GU1MXOwDcAY3vxGKRos8JqiXaSb5iMvq2drROi+mHKGY/9um4rqn48+BPZfmg/MQ6YKg==
X-Received: by 2002:a05:600c:64c3:b0:46f:d682:2cb0 with SMTP id 5b1f17b1804b1-46fd6822fa2mr2234045e9.21.1760394007959;
        Mon, 13 Oct 2025 15:20:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a60b8sm209211865e9.19.2025.10.13.15.20.07
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 15:20:07 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:20:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Subject: [PATCH 1/2] test_shazam: clean worktree before git am
Message-ID: <6954648599801769acdf677cb9bcd74daa36281b.1760393880.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dB8go7U4doyQ3nP_xZoacJsTpZ5r4bNEju_TId-SWdU_1760394009
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I see the following failures on master (as of commit 965071ee174d):

- test_shazam[shazam-git1-just-series-shazamargs1-compareargs1-shazam-git1-just-series-defaults-b4cfg1] FAILED
Error: "fatal: Dirty index: cannot apply patches (dirty: file1.txt file2.txt lipsum.txt)"

- test_shazam[shazam-git1-just-series-shazamargs2-compareargs2-shazam-git1-just-series-merged-b4cfg2] FAILED
Error: "fatal: Dirty index: cannot apply patches (dirty: file1.txt file2.txt lipsum.txt)"

Both tests fail because git am can't apply patches with a dirty index.

Specifically, the worktree is created with `git worktree add --detach --no-checkout`,
to save time checking out files to the working directory.
However, this means all files then appear as deleted in the index.

The test attempts to solve this by a combination of
"git sparse-checkout init" followed by "git checkout".
However, "git sparse-checkout init" does not actually create an empty
sparse checkout cone and additionally "git checkout" by default does not
update the index - it only updates the worktree from the index.

As a result, when "git am" tries to apply patches, it fails with "Dirty
index: cannot apply patches" because the index contains staged changes
(the "deleted" entries).

To fix, replace "git sparse-checkout init" with "git sparse-checkout
set"  - with no patterns, this actually creates an empty sparse checkout -
followed by "git checkout -f" to update the index to match HEAD,
clearing the staged deletions.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 src/b4/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 142da25..31c7fa4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4501,12 +4501,12 @@ def git_fetch_am_into_repo(gitdir: Optional[str], ambytes: bytes, at_base: str =
 
     with git_temp_worktree(topdir, at_base) as gwt:
         logger.info('Magic: Preparing a sparse worktree')
-        ecode, out = git_run_command(gwt, ['sparse-checkout', 'init'], logstderr=True)
+        ecode, out = git_run_command(gwt, ['sparse-checkout', 'set'], logstderr=True)
         if ecode > 0:
-            logger.critical('Error running sparse-checkout init')
+            logger.critical('Error running sparse-checkout set')
             logger.critical(out)
             raise RuntimeError
-        ecode, out = git_run_command(gwt, ['checkout'], logstderr=True)
+        ecode, out = git_run_command(gwt, ['checkout', '-f'], logstderr=True)
         if ecode > 0:
             logger.critical('Error running checkout into sparse workdir')
             logger.critical(out)
-- 
MST

