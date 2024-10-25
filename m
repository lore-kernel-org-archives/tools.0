Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444D139CFA
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887386; cv=none; b=nL/gUlZzDTkPqrROcTjuGsIkvQzMD02+kPS+zk8KAMs/ApKuvlYDOJDZ7pZBSTj4126Pw5K+Tntx4dAMXKemMcpUlJ1CIBMCXGfy3qjIlo/RzxiZfvX/b/1j7ui5BOfmedXV+QHMiP9A13/Sd3cSI3Jnx1EJDvJ17HGIUxINJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887386; c=relaxed/simple;
	bh=0awfLOppbvGuE+SGvpO55DBynubQv/bhicz7ZPCvabI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfBhfh9PpbntcPJi5rQIsvVBVDxU9Jm/bSLnOBjeTQQFaaSFVKms5d+DIQ+DKHqhUs+aHE5DdYUoMLBMpDLVMmC2cCar7yeEaY7gUa78x26EVtB9nsRSF8y//DV1TB36AofGGEKPoL0JtRq7EmhG+g6TrUKoBEhdGeqi50C2BbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AICoHay4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AICoHay4"
Received: by smtp.kernel.org (Postfix)
	id 9DAD5C4CECC; Fri, 25 Oct 2024 20:16:25 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C701BC4CEC3
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C701BC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7180a5ba498so1273750a34.2
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887384; x=1730492184; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4umdQaNw/jPh7Bv7a/9BIO1YLuzyeQcqvgA2Fg0Q7A=;
        b=AICoHay44FONcs0D0zowZcN/9WTytkqZjkcNMGrkFv7fhO0XO1UFYcDjJpR6jwNlkw
         UU0v1DD1DZHBokcoplGsoOqqeJR/kT94HNcylLh9xoA3syedSFwjmKUuG05cFr68DvnG
         EviinqT8OaJjVtJRWwl3kMXsPby3X87dshMpnEHs3vfgqEBxn1N0rej3qS48tmf/v5qo
         xLetkapdjpuGY6tMB6wzELF14t3393Tc2KAR3lNZTUg8+dppgkM2ix3rBKQjSHvhoN3S
         h7GeBOrsnIdmyLD44pxFmUuef4F8eTgq9bBzb8a2chTCsz1ipbEBV/Ykhp+WYH3FZQZR
         DLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887384; x=1730492184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4umdQaNw/jPh7Bv7a/9BIO1YLuzyeQcqvgA2Fg0Q7A=;
        b=TZxPP/F+KXVvNYPNZQlU17DQ6eHHeImt4MgnNdjjJ/kHa8WqD7yaS1alocYZZfOYm8
         SuPkUKiwk3M/je7IF1d4U/rmy6Tk1kQ1H+3aZM8loX8cnjlEXbKAZtC9U+jPtMYz4Dkk
         S3cmQ3mYKn8DEqRYW0fUG0upK4ISK5jdI/1uRVYjmUIwpIFzkyVtZc+j4pAXu/oBvkp6
         6TVWBm3Vefvh1lfSOI0NTUwi3x2c0KjZ+dZWFNZM/JHESj8mbvYA8Rzv4SqN9E30G91m
         eyezmhO3AFi4fIaYIej6QGi7YQvW5yJl5uRKiulTP/7w/ocOHhTTJU2cHY7TI938+cs9
         6B5g==
X-Gm-Message-State: AOJu0YxpCAF+hQ8L/yiPCtD/7fyXWxlvE3qJngFa6sPQ3ysdA4GjYAKG
	A27BgCw3GjxPxAr6q66BGU8XmAUjag3UWraHKjjMviP90RZyHi1P
X-Google-Smtp-Source: AGHT+IE1Y9nc2eJVaIcQm4mg+9JZexY+pD7mOSs1xvqB6tH/viDJY2LzPCM4qh+y7QIZ8ZNoN9toNA==
X-Received: by 2002:a05:6830:264a:b0:713:7415:3c61 with SMTP id 46e09a7af769-718681173ccmr644087a34.9.1729887384037;
        Fri, 25 Oct 2024 13:16:24 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:16:04 -0400
Subject: [PATCH b4 2/5] Avoid file descriptor leak
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-better-type-annotations-v1-2-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/diff.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/diff.py b/src/b4/diff.py
index 63e60f2fc82c95145a897c2dd319283996ed5a8a..743127ef0a1922eace81686e27cd0366f8e42f9c 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -174,8 +174,8 @@ def main(cmdargs: argparse.Namespace) -> None:
         sys.exit(1)
     if cmdargs.outdiff is not None:
         logger.info('Writing %s', cmdargs.outdiff)
-        fh = open(cmdargs.outdiff, 'w')
+        with open(cmdargs.outdiff, 'w') as fh:
+            fh.write(rdiff)
     else:
         logger.info('---')
-        fh = sys.stdout
-    fh.write(rdiff)
+        sys.stdout.write(rdiff)

-- 
2.47.0

