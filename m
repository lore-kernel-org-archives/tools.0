Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEC29CA
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 02:57:36 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id b22so7488440pls.1
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 19:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sd+fMca+OHg+Oayjev4kUzWWDLDnqjVSRx4zsIMegwY=;
        b=B2VWlitUWjCOKFdmLy3gdP1RTGJ7y089u38F/RwmDWp/YHBBJkIlEYps8AcMPZtfhp
         CU2B7iuTVku4brOlARQLiX9jdC8GUmHLHoIRqCZlL8ysr+7BPS8H9zg5+2X+DMhgyCQW
         4X/5yZvp6/VekKwWC6IudLOGlCnJCTg3aMLWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sd+fMca+OHg+Oayjev4kUzWWDLDnqjVSRx4zsIMegwY=;
        b=QtbmhgYJN6eE0F+O/YDYTrHOb/7iWebrMmcBmE2fq+sYfmfshb123/3bu/YPQPuGWe
         1ymSP8QNxc6oD4ku4gHaxPEDaHm/+RwemqHbBXKyf5omvFelogBwi9AmCc/gbsa+gCSM
         AMFWlNWY/D+gw8PWtlitraZZE8iRaDZw8gihtPiquJSEV9coktvqzVHqYFO6WM0IjMbP
         H1qVZfgNl+kCuIzl3Cn0qhGC8MjJxQzIfV3YYhdB511W/xDpmxFt1dkoa7Az3eEQnhZ4
         zooOD+AyBiLvL/g2DCf8CyZ0TVoHBzLk73GhfwLGCQ3S92GYzkRGsgU4vKIRzNyLNsHY
         P7Sw==
X-Gm-Message-State: AOAM531MM9Z0f/i2S5uDRy/dtgh5HoRzc7qB5NsBwwnb+I4SwJ0SVBwK
	lRRj1YMdoxSpvBvH9ea3aVyBlRhlYzt/tQ==
X-Google-Smtp-Source: ABdhPJxCLh/G1ZicW3cLlIFYhgnOaTt1GtI+25Wf8xYZ4BwwEI9rb7WS9IIEy4V5KlrimpXOMKqg9A==
X-Received: by 2002:a17:90b:14cd:: with SMTP id jz13mr4882716pjb.192.1633143456495;
        Fri, 01 Oct 2021 19:57:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m28sm7313452pgl.9.2021.10.01.19.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 19:57:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH] validation: Report lack of signature
Date: Fri,  1 Oct 2021 19:57:17 -0700
Message-Id: <20211002025717.3337059-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; h=from:subject; bh=qYA6X4pJyGYXnaHsjeBSoiH/s5qgzotJmf+bGg5uRHk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhV8qNFmZc7FVXEUhyjCzm5xpPZ+V5gT1Ool5z1Lyf w99IpFCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVfKjQAKCRCJcvTf3G3AJqB+EA CjXkYzPl8olaTaUDJCuABVJ782Owp/Vwd8j/M6zhuC/Il+eKP1T+cGv4Bc9AbdlJ2HTA4HLNnAVuiu zlDmGQM1Qn2+ZIN2rcuuyOZmEvWWrXzRCaTD7WJyjLvQ2s3GravM4oOKRHc3Et/OCIh+RjVVxa4gcf 5jW08p7yE1XuCv/xnylup6eZVtbRoDuc3HOFXNZTQErBvkgWyuzmYunOmDEoPo3IZf/G3wRDvcltqt JGqlY0b6CXKdYKyW/yMKSZUOZPUztkMQ0YFmptYHWxXH+tc8U2Qvda/C8T9AZfarUTEYeluCe05M9i qWBmqrXfxaJXoYU9KvOdssI9xtAsL8NZaYWXlGn6tZ1Zi+KWrRnyyx9fS/VB6FbKrkB+E7L/US8kwh 1OxBUtpXRRrWcdmByW2Zh+u6SSP4ulD2e4jmVcSK8W1oVJnoRtHfT9Yid6jt510dxZsPbk9iA+xhd0 7T8l8Fz0dwu3UO5DaxpZcfJEVbQGWUzFMYVrl+okcoDYh7FDK4gA/m1yeXG4zqmp+XiOMhsx54sdIh qQ5j3222VTyEN8BQFZ4YRHh7dtNlIFdkzabwOoyz1tBfyxs03EI05x2CV+pjdCWhj/jcGu+JvaLX/X a9evxzxPK44AuneUmTOZTPOIAx9il/qxjI3eL83YxnchtTmMj2CRyd2mQgHg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

If we're trying to cryptographically validate a message, not having a
signature is not a success (exit 0). Use a specific return code for this
condition and report it.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 patatt/__init__.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/patatt/__init__.py b/patatt/__init__.py
index 41b7dfda6b75..5d880bcf32b1 100644
--- a/patatt/__init__.py
+++ b/patatt/__init__.py
@@ -36,6 +36,7 @@ DEVKEY_HDR = b'X-Developer-Key'
 
 # Result and severity levels
 RES_VALID = 0
+RES_NOSIG = 4
 RES_NOKEY = 8
 RES_ERROR = 16
 RES_BADSIG = 32
@@ -919,6 +920,7 @@ def validate_message(msgdata: bytes, sources: list, trim_body: bool = False) ->
     pm = PatattMessage(msgdata)
     if not pm.signed:
         logger.debug('message is not signed')
+        attestations.append((RES_NOSIG, None, None, None, None, ['no signatures found']))
         return attestations
 
     # Find all identities for which we have public keys
@@ -1019,6 +1021,10 @@ def cmd_validate(cmdargs, config: dict):
                         logger.info('       | key: %s', keysrc)
                     else:
                         logger.info('       | key: default GnuPG keyring')
+                elif result <= RES_NOSIG:
+                    logger.critical(' NOSIG | %s', fn)
+                    for error in errors:
+                        logger.critical('       | %s', error)
                 elif result <= RES_NOKEY:
                     logger.critical(' NOKEY | %s, %s', identity, fn)
                     for error in errors:
-- 
2.30.2

