Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961B16BE3A
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043247; cv=none; b=X+95prNV49xIbi9vW/Ud6ceVFboZJOqkhNF1EFlVr1m56nyqmmtjUctoRZaTuyvsbXOVdgf58oHtSjlARlfZnscknLLrJaimCi8CPIbPGKBG9vEWw8g4cjLx7aVbqZ2GMtheUiFLVm0HrHI4TG+KgTOLsNqN6KMbrkD+LOtFNl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043247; c=relaxed/simple;
	bh=mdjk1FASx8K9Fca5g8HKWaki5BgvEPiAlQXaqr3NPec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3Nuje9k1XwbMzgfRX9RiKDOesYgp/NYJ/8jqPcH1sk7aBsCeaoozcw8LtT+P1YiyEBWat8VT4gok1ZlDaS3ibcxVHV9gePJtQk3FgfToJz4SgaUGMVgWwN0eKLSC5bDadtMoQx3zCFB4wqHlWdQ80mQw20uDaip/4BgFw78hMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBpVEcbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBpVEcbZ"
Received: by smtp.kernel.org (Postfix)
	id 3E21DC4CEC3; Sun, 27 Oct 2024 15:34:07 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56FCBC4CEE9
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56FCBC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-83aac75fcceso125115139f.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043245; x=1730648045; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJrWISz0Xuvy0CmSlmkPNOkC1LDH7C1+EXPLkzYe154=;
        b=KBpVEcbZB8reLBr0/5t+O/NgW3kNDDPUXon57/2sFVJkm04x/Jqus66vA6FibDS4pA
         K6ds3TyjIPSfJPm9i7OjpMDSDmtdXBhNZcegyeebq2k9B/FKJrNx9HzqsxIg4VZTAWSk
         vaYVQ/cShnfvyHoj6jS+VN0FzJ5vzTrOhD7lwTsCtxhbSaDGBEO1EkbHupBeVcOORHZ3
         4JFgdBh7mcMjqgTSVcdq39U7PmXmEJwF1zWBXbYkLkKHmAzbWfIdcN6PvoE6cUtNf3Kp
         SwyDnNvgHRYqqPwj5FYHpKUJYKIgT5R71kR1OWIHloiuhzSBqr+DoQ8j0k2jnWODo5NS
         t5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043245; x=1730648045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJrWISz0Xuvy0CmSlmkPNOkC1LDH7C1+EXPLkzYe154=;
        b=il+vP6nY4sljLXrI6GsOs4pcJZMAPl9lTN9Ae7F2ntZYoytFUUN+VpGwU8LhQo5OUt
         hT7f0n0uYCPVCvZKSRbUFczm62Rvqd17HwOnkBOvonKxR+lXsb3nNJpjryuF2hXoKZFI
         Uljmd7CaU+0YaKNcBlr6gvfNVpf37wUeql2bb8oa0ZAcCPgENG53Dh7QkTQhJSe/1Ewb
         9lsaUGLTk5Ak6DBdNYs6dFDoOWTzSJlRs1rCYufrr47yhSXMJSUczxVnJtILcHYx+jxL
         XoHh/O9CGCaQzQjF4KAubhDAuRXwVcY7gVZTh/YPUGK75w42Rfb9eWHhVHDFKT4G9gID
         rxaw==
X-Gm-Message-State: AOJu0YwrTdQN1EytWzTGF/AeBvmolTtw+qE5jTdj4pJPBHFOLLakTvll
	8wdheHv2d7DtY07s+9LOQ8nEXG37ifOfmVdrtdHQmC7bbIFg++gq
X-Google-Smtp-Source: AGHT+IGgYugro74+WxAFveOce2VdZos6EfUNMVZCaCdhZjsrzZC2+lmmdCmBPEBt9q+63nGWQ7P7Rg==
X-Received: by 2002:a05:6e02:1fcb:b0:3a0:a311:6773 with SMTP id e9e14a558f8ab-3a4ed34fbcfmr42024325ab.21.1730043245217;
        Sun, 27 Oct 2024 08:34:05 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6e567e3sm12146635ab.70.2024.10.27.08.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:34:04 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:58 -0500
Subject: [PATCH b4 6/6] src/tests: test for trailers with special
 characters
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-6-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

Test that email trailers with special characters are parsed correctly.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/tests/samples/trailers-test-simple.txt | 1 +
 src/tests/test___init__.py                 | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tests/samples/trailers-test-simple.txt b/src/tests/samples/trailers-test-simple.txt
index da64caff8dfaa0cbc630c8ae3515f4508cfd0764..a82416354012d3c32f99b39d1918ac343f2b66cc 100644
--- a/src/tests/samples/trailers-test-simple.txt
+++ b/src/tests/samples/trailers-test-simple.txt
@@ -4,6 +4,7 @@ Date: Tue, 30 Aug 2022 11:19:07 -0400
 
 This is a simple trailer parsing test.
 
+Reported-by: "Doe, Jane" <jane@example.com>
 Reviewed-by: Bogus Bupkes <bogus@example.com>
 Fixes: abcdef01234567890
 Link: https://msgid.link/some@msgid.here
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 85ccd190677daebc30b9987eb811d44a15dce79b..a4637b9c797367da462f062511fdf4e018a5b81e 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -57,7 +57,8 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
 
 @pytest.mark.parametrize('source,expected', [
     ('trailers-test-simple',
-     [('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', None),
+     [('person', 'Reported-by', '"Doe, Jane" <jane@example.com>', None),
+      ('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', None),
       ('utility', 'Fixes', 'abcdef01234567890', None),
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', None),
       ]),

-- 
2.47.0

