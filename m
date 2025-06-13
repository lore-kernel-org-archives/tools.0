Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF72DA761
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804827; cv=none; b=GamiIOTpIz0jB5wEpe233X2I2Nhwmeq5yjC/cmlOprWv7sBOrG5wxxGUGAZntf2hweaipIEtbynD9lm7awUS1I0RLlRdnpswuhhFxj+9Ek4CKYXXqTMMKoNMZVvQLW5bRT47U6FQZNhMjXLQKZIXYYDssCbaIC8kKFkiiEsnS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804827; c=relaxed/simple;
	bh=edrICiOlBy1PG2eWL75qHh8XqYKuHkAh787UIk3pI08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuOpMM3lDR+3Sypsk8ErkB01FIb0F+OeU/aGISR0E4gzpPRm1/PA7CalgO12kD6iNfgLZUqpjwpvZDsr8EzndU25a0Ib+oCfW0fVJSM0QxpOz+tCSj5st2v0oue4b10+iMAFEAhg0pEk6Jicya9OjBb/GnRgxI4Ao5m0EKQGsR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XqPwXB/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XqPwXB/s"
Received: by smtp.kernel.org (Postfix)
	id 791F7C4CEF0; Fri, 13 Jun 2025 08:53:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13AABC4CEEB
	for <tools@kernel.org>; Fri, 13 Jun 2025 08:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13AABC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so307598366b.1
        for <tools@kernel.org>; Fri, 13 Jun 2025 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749804823; x=1750409623; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftCPQeK/3+B5nfMf3AiUEZgGveT+crWLvadJx8Pkdi8=;
        b=XqPwXB/sFFXHXXWorZJ5s12cW/KdVvksMQSLMRsF7/6sm2+rMWIdjJQ62MNrwyv29R
         oPHhX8NZ/ILou8HEbxs70j7GPK+M24YX7tF1JkbORYqXu6hxZHjm0GAG6CqyGTNKJ4UA
         VRNzJOtXZh447aofk4uLO1hsY6dJGo/QjoIqK/m/vmE/R+wdNt3FVENaKa/wy1cb0NMv
         L0OmeZtsT6MfR6X83j0GwcpCa0a881ikwllNBjn2xz+IKJS9wIRnz/pFQGxVMhF98b2w
         3RsHpqvKnqBAx0Y9bidbvytSAtuHtEa02t8O2zEdBWScQbt9irgYM2exQlKoz9Eu8k5/
         ixZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804823; x=1750409623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftCPQeK/3+B5nfMf3AiUEZgGveT+crWLvadJx8Pkdi8=;
        b=kJ8Xvc58spSh65StlBECNoo0XZPOEiPMp5ChGl7BpqEiYGOx09WM0QEs9AyFg+nx4l
         eReqSHyHr44aKOyxHOzMpIKcjtDG36Vkt/c/DtIGVoqSy5Fbq3WmJK1kXkfeZZKITvgG
         cc7O7mElU4PHvBrkOlbK8tx6U7kYLEJcg2tIRfQglLdMdnJEU50rhj6dgDe7KjI7Wu3J
         K7/GmJjUSZ/pDjMHi0LhG3UkJtJDlZTvzRqRM51eioAmshujSBeQmJ/LoXzCsIBG745l
         7Q6YOZ0WPZGtj+IGQDClb8NZU6+21IAzHj1XUK98kmvwbBOP8oX/82/VKjVu7EG9yy1k
         IKew==
X-Gm-Message-State: AOJu0Yyb/9DAKCcmcnJXIupzPG1nu4q1yp923PnQI/9jQJGtMrc5K8KE
	3E6HmBq0WDJSf14OWJjmtjTtkQobicxdDXOiJR5xv/qwwlLZjXpz4j27X6EsiNoA9xU=
X-Gm-Gg: ASbGnct1LlJ8HJlk4oz2vQAh36Fi7y/yD6uvK4qc6NT9/5+WDkg++6HvfnXNbGju9Zg
	/xGHok9na69fwr3WSz2jLvcztcEDrVtM2EvFjQ0lFN9hR2AEcTKY7HOX5nSN3S02+5jHyJ6D2bq
	iDE9sqWLVBGjrv+qG3R7bKqWGtd4qiIqMFhMpZ6Jn2qNjhwP/hgyW9l6UCkMDB3TdD4msXetNVV
	Lgsc4OqPf8WsFlkCiOhTfFwT/3epvd9DWJXRbZ+/cGVbcXslSJOqV9wudYHysZhZIciDFvqxmwd
	JnDaJ4hEateLbaWFnFBbfFeVVy1Hz8ROMLV4JqhURdmm1rhL7HIima0c5EFIIvx0N01OT3l2TcC
	nsQ==
X-Google-Smtp-Source: AGHT+IGH8Ld8HlHi947/DwH++VYVkgKJANovZ7I9SI9ifV+ZhijmVDAfWCAPaHBpve5gvsjOQK2Slg==
X-Received: by 2002:a17:907:968b:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-adec5d523bcmr166009566b.51.1749804823281;
        Fri, 13 Jun 2025 01:53:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec892b0f3sm93419866b.126.2025.06.13.01.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:53:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 4/4] export-keyring: Add an option to ignore the linter check
Date: Fri, 13 Jun 2025 10:53:19 +0200
Message-ID: <ab3d55eca085e6cb526dab57ad94e5567b3b024c.1749804735.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
References: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=edrICiOlBy1PG2eWL75qHh8XqYKuHkAh787UIk3pI08=; b=owGbwMvMwMXY3/A7olbonx/jabUkhgzv58znRasyDSt6HrXeanCLjBLhjHlb5DLT4Ocsl/27/ gut4V7eyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE1ixi/yvcm8zRqfHRYG+h AuPkFJ1MsdJ0DeZvqt+PJHAbR4i9chK7u1Dxts2+P1qcKjFem4tf7dOXNAo2Oycnu9wqRnlBkWD tHp42BbaJazcqpX6rtHA6l5zh3XTKfqkWk1ug7Nzk+Cn3ju8U37Cz2vf19riqS28s1u8Oz5/Zcu vyfss7t17MO9jrEr5/4oZnVg4VvHONmScsy+Ixy37MOK/7w8FVRd+nCbh83TDBqcZr6eT6yj2/J GStpeX8Fe9Ne1q/qSKi6w/Tq12aHxIVH/X3fXqfmK20b99mCZMnMfMiE3Z+1PJcNGFJDDOT7skk wdtBTN5T5v8vU0trSSwqdglO2pJ3vIKvq0z597ylBdeqAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This is sensible to use in certain limited cases. One of these is to
force certificates that don't pass the linter check to be cleaned.
---
 export-keyring.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 14d190c83db1..773aa5f8ad83 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -31,6 +31,9 @@ if __name__ == '__main__':
     ap.add_argument('--verbose', action='store_true',
                     default=False,
                     help='emit extra logging')
+    ap.add_argument('--ignore-linter', dest='ignore_linter', action='store_true',
+                    default=False,
+                    help='Also update keys that fail the Sequoia linter check')
     ap.add_argument('--fromkey',
                     help='Top key ID (if omitted, will use the key with ultimate trust)')
     ap.add_argument('--maxdepth', default=4, type=int,
@@ -173,10 +176,13 @@ if __name__ == '__main__':
             header = wotmate.gpg_run_command(args, with_colons=False)
             keyexport = header + b"\n\n" + keydata + b"\n"
 
+            # Only do this for newly added keys
             if not key_already_exists and not wotmate.lint(keydata):
-                # Only do this for newly added keys
-                logger.info('Skipping %s due to bad linter results', kid)
-                continue
+                if not cmdargs.ignore_linter:
+                    logger.info('Skipping %s due to bad linter results', kid)
+                    continue
+                else:
+                    logger.debug(f'{kid}: Ignore bad linter results')
 
             with open(keyout, 'wb') as fout:
                 fout.write(keyexport)
-- 
2.49.0

