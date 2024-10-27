Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC861E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043244; cv=none; b=p7h+MvBNJNfd5xI1FvPNqNeV9U97m2DpIIWdTYESnL9z76j8HI01xRylCXVVlPDU2gTy/0XXXLUiESb25g2bq7gxj0oMIw4hafyGp3zUnobJ1qBNm25HsrV8cy+DWQKRGn9qOUFCEwJQlE9rXgFuTXEcSROVAqfZU6nMKlIMuio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043244; c=relaxed/simple;
	bh=K+l16sqaq3lJf73NknBv3zEhSAGS6mixircG+nne7Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5Mrgdi2134f1harGZW0wFrhPCzr/MAbOdHzs/izsogd62YfmFRkqmMWy7QZUfFlWvpRqPsY9bhl033601ZK9vxE5wDtLE7vC7I0yJh3hK4A32jmTxqiRyct2cxmCzT+AaVeg4wDXjkGYPoXpcCfnLL7FBptvasGy3AEfxNYiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQdH2BxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQdH2BxU"
Received: by smtp.kernel.org (Postfix)
	id 6A51CC4CEC3; Sun, 27 Oct 2024 15:34:04 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ACD0C4AF0B
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ACD0C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-83aba65556cso146455939f.3
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043242; x=1730648042; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9CiP9VlwuLskIhfXi//tZDR9ko36YCjXLZj3JRThY8=;
        b=EQdH2BxUmgjYMRESTzgE8xU85GELnfcOyyzJmg5Qa+UuFhHZBVUuhGSQRZkSFTJoDj
         2hSyBDsy5l6qHt/FeDsJI7uc/E6hMO9UE7/F80BEiaPYwo8PoUFLYv940TNCjuRotPoW
         6mKFneWr6bRYpRCYz6mh/nFwSDW2KFK4MadT3kH+nd6J/TlI00L95L3guFGPnL+u3AN1
         rIA/lETqkerNxz97V4WcJds5LeUW4NrF/6OPMELO8FHdOulXTFtMjFUoivAAdZtcq2So
         /gZsWEyWtw58+aSGD26wFkDsqvR6Tz50xyEYxeiia5d3W7mzRukiMncBM8CxXk+IkA+M
         BZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043242; x=1730648042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9CiP9VlwuLskIhfXi//tZDR9ko36YCjXLZj3JRThY8=;
        b=Flqre7CxGXr4ig0XflIGmWVRk3QGM3dhLkxGtHPQMYOWXsvlJKep4Zcab1h6BrLyHs
         8OBtNTgiZz+r5TGrDrZgfkhry6nP9dsjL/de3s9/Ho6Wk6Z3GmpSU7Oc54AZGRrBhKRo
         TFy+MpHdztH7CnUgXArw0JV5yOuKW6u5VXy810nG79gNDyFkx8joWRBl2D0b2ck5cxD2
         Ab9nM7zuq7Nwm9zh1EvhDE/m+oIIlCRYpzHikA495Yk5FPDuvXcuf+L967E+edixYLDs
         szaKIHv4lGtpHNkChz3/2ssWFZw4HQaQIzBFJ2JHGeZ7quvxMwRjB0SzDjEWi2RMaZKF
         W7Aw==
X-Gm-Message-State: AOJu0YzNvKEfsfr69OadrXufYFMgu+gaim1stPsfAXkdCdB3tKtJ6UVm
	A6yY35Row2wuEqW3J7sSAfF9tpDTEssd2lvzbmutIp7zLrC8bDzn/Pq3p5Ks
X-Google-Smtp-Source: AGHT+IFpwGza/eu4BUrQUZe5ugAfFnYa2GlRm7v/YQ/+6w7GGT+zybZ2iH6tccWeTLmUPMxBYHEQ9Q==
X-Received: by 2002:a05:6602:29d0:b0:83a:a746:68a6 with SMTP id ca18e2360f4ac-83b1c43e1a0mr529469639f.5.1730043242416;
        Sun, 27 Oct 2024 08:34:02 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b137f486dsm107413839f.24.2024.10.27.08.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:34:01 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:56 -0500
Subject: [PATCH b4 4/6] src/tests: test for trailers with improper
 formatting
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-4-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

Check that a trailer with an improperly formatted email address will
still parse to something usable.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/tests/samples/trailers-test-extinfo.txt | 1 +
 src/tests/test___init__.py                  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tests/samples/trailers-test-extinfo.txt b/src/tests/samples/trailers-test-extinfo.txt
index aa61e8d635923c2e2539b82c60f69b489ad7cee3..5417cdd87bfdf4ddb278e125a6dd04d2e86af141 100644
--- a/src/tests/samples/trailers-test-extinfo.txt
+++ b/src/tests/samples/trailers-test-extinfo.txt
@@ -4,6 +4,7 @@ Date: Tue, 30 Aug 2022 11:19:07 -0400
 
 This is a simple trailer parsing test.
 
+Reported-by: Some, One <somewhere@example.com>
 Reviewed-by: Bogus Bupkes <bogus@example.com>
 [for the parts that are bogus]
 Fixes: abcdef01234567890
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 7fe43b0158460f06d0a2b52d2689d26e7ef7f840..85ccd190677daebc30b9987eb811d44a15dce79b 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -62,7 +62,8 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', None),
       ]),
     ('trailers-test-extinfo',
-     [('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', '[for the parts that are bogus]'),
+     [('unknown', 'Reported-by', 'Some, One <somewhere@example.com>', None),
+      ('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', '[for the parts that are bogus]'),
       ('utility', 'Fixes', 'abcdef01234567890', None),
       ('person', 'Tested-by', 'Some Person <bogus2@example.com>', '           [this person visually indented theirs]'),
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', '  # initial submission'),

-- 
2.47.0

