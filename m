Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02BB17C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068509; cv=none; b=HCY3cGZu93XqLcPAMIGmxYvsJo24ajJpWFX8r+7jOI7bGUHNGNhjOzGXZ2kT/SE0uQjwCOTtbAKSOMuTwQI4+NuAqgFAT6t9omF9CzMJDb4dldWMJzoV7hVGCHKrAmp0lkb6DQpq2vyrdn9WDWtDW1YRXQS67D29lBFfdyrCr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068509; c=relaxed/simple;
	bh=mdjk1FASx8K9Fca5g8HKWaki5BgvEPiAlQXaqr3NPec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImCKBBY7aQU5wOVjnmiyvpxLP4gY4O7apa+L5ZZt3U+Jvqlbce4Iq7QJu+SXP48MWK5YME8KxYd+JXw/rhD3fzICk6IYRlzMR0ogDhJ9WvQSWpzRJD7PEdHTGgW4B63bnbP7i6T4KOiaV65kaNZWxMCBRbC+0r41Vgsc6Rg4VFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mtq0dHwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mtq0dHwY"
Received: by smtp.kernel.org (Postfix)
	id 4E3B0C4CEC3; Sun, 27 Oct 2024 22:35:09 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6759EC4CEE5
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6759EC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83abc039b25so144162039f.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068507; x=1730673307; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJrWISz0Xuvy0CmSlmkPNOkC1LDH7C1+EXPLkzYe154=;
        b=Mtq0dHwYlL3MoiXOk7JsyZPFMiq5Li02XBUcBV25VAHx+cjmS7nFTKmAk2f0MxEZcm
         Rlw3CuKIALPnnMEIHOutAGmIbTVbu/IveUAdGjegAuxjQwnLSFUNRErCjOAsJMviEfMd
         n2M2axDWG4ybykNO1iTAM6NpdBeYpAefhfOkQYUibrRChOGmXJLd+2KAFTEG6LVE3iK0
         KQ4FRLYBLwF10WjTd0Woqa3V2Akhak3/4iBsDXWtWr55OpktmE6dqRL0HMly0bfHUiCs
         fl97CfjEeIYAZ7ne+Sw75Vjq/sKvdWQrKbe4ZItDou+jLRI1Nu/zYThkIwfFAo7SZ0iQ
         HzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068507; x=1730673307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJrWISz0Xuvy0CmSlmkPNOkC1LDH7C1+EXPLkzYe154=;
        b=S6oeMZPFNr6leVeKXdHc0a6Y2Pfm1uXH8sFiVjxlkUMGWCXengizGOWA87PDh90WXy
         YLgPtrgbD+tyNc/deT5t3q2jrPtMIq7NgbnV2zdqLVX8tlLXsy4cKj37J3pMv5OkM21y
         21r3MEduX4ihAflRzvk42vPtf9HMscnNt9kwZeaug6aoMmjGuex6UhCxTsjBM3J3eZPp
         cLyLb8DR6YhDtmSei/eAW/xJTXErvD1rZ7N8qeHtIB/I/CqtQvmaWKJ2UYp+8yufhyLt
         TdHzxruiaT/kIN5EXBvURSn9cg9T8enbJORH3T+7B0Wc6WQ6KcNkQBamTI+dy9y2raHq
         8vgA==
X-Gm-Message-State: AOJu0Yxd7NW/h/CeKVQxq2UEUJhQmbE47xOOmmy8gnfMiE24TqbLjl9H
	YnxGKSE8PTFUVsHcJWYnqL8WA4G4OJ0xZVVm5Gtk9O9rTOTPVPq3Jf7MFDMu
X-Google-Smtp-Source: AGHT+IFBOoJbVwsn5tV+0uIuzqoQuybLA0S4m1r90Lf8zjYZaBtzZvkAZbeFYokNZRlu14X49KAuBA==
X-Received: by 2002:a05:6602:2c95:b0:82c:f8fb:2c23 with SMTP id ca18e2360f4ac-83b1c607e2dmr450051139f.15.1730068507351;
        Sun, 27 Oct 2024 15:35:07 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b137c9996sm116080839f.1.2024.10.27.15.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:06 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:59 -0500
Subject: [PATCH b4 v2 6/6] src/tests: test for trailers with special
 characters
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-6-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

