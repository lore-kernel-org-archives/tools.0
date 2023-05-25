Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF372415C
	for <tools@linux.kernel.org>; Thu, 25 May 2023 20:11:12 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30a8fa6e6fcso1805732f8f.1
        for <tools@linux.kernel.org>; Thu, 25 May 2023 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1685045471; x=1687637471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3dIUL9quv0epIFTeV7Zm+XcdN5CdArA7z2rZlmGDu0=;
        b=KgfNCX0bSiRsutkwj5c5Rm1Ls6VobQpAHkN+y3o1BuXI37S342f4yW3jPbtEIMUZNj
         mE1aMhnbucmAoqGNFX2TO2WYEV1LhRdnE8NDS/YKSmBVXMshq7dhlUVDPZwV/5TexMyU
         vripf29S1nkBoz5s4h2OiEDTidipEv2oceXH0IkLdqf8mK2XDda5Ruq0ye/LVs4Bn1DC
         MlYQzUFdqAryio8aLLsmKNA9zASY+PkEN2Gi/F2e85oG6vFiXP7fVnV65HP6WpZjIT7j
         6X5TmfETWZRz0PEs/f99/taMCQK88blM+VbnMEsPEf1PDe6tdJ01a7auZRZ890qj7t17
         jlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045471; x=1687637471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3dIUL9quv0epIFTeV7Zm+XcdN5CdArA7z2rZlmGDu0=;
        b=b95vIh5TZtq89esPcVXMX0vli1Jpkg0VW6nZIlh1vGYc1f+j//itnmE73yb3x+dSPc
         1+pNYrKA/LrBCmofFCC1SgXK1nDnutwmHk21GtDGkw38ngxlzl7MCsTOLOTyzfpiRJ0h
         kzlEBbLyBRZZDdiPZVS4s+iimkPNvVlNcaTLZ49scCD9HMF5lgOnxqiSuPOwWZEyfPa+
         doqStWqQrxTRZkeJEF7mxVNhZwB8NKYpCXP3WtzaUvRxB5TIYlsOQChfkIlrD4CdAC/V
         YSlDppRe0nAh7/uxwW/HXQ5Ko4vQ8ZSZ2ohqxikKkTSUb2VWFTSwtvOWjWXWqJ0FZQBb
         YdQA==
X-Gm-Message-State: AC+VfDyp9K7DSP4hHjwKV/O+zYpYS41bkYRojVzXcsWJxMXM8cOxCik9
	dDVxupxkc/dnyVyghjTticlYrw==
X-Google-Smtp-Source: ACHHUZ7hbjlFul9BhQ6lsFkY6iiT8IZW8bhnKF8+uWKmg2aPtdDCUoOQ4BzCjgUf8788AI2sQCH6Ag==
X-Received: by 2002:adf:fa87:0:b0:309:36e9:5834 with SMTP id h7-20020adffa87000000b0030936e95834mr3407382wrr.61.1685045471078;
        Thu, 25 May 2023 13:11:11 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id f6-20020adff986000000b00306281cfa59sm2802772wrr.47.2023.05.25.13.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 13:11:10 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Thu, 25 May 2023 22:10:36 +0200
Subject: [PATCH b4 1/2] trailers: accept recognized link trailers
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-closes-tags-v1-1-ed41b1773cb6@tessares.net>
References: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
In-Reply-To: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Follow Upper <follow.upper@example.org>, 
 Cover Upper <cover.upper@example.org>, 
 Test Override <test-override@example.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=yyNBdgf2YDpZ9rnvnECQ6UVhsIDwg/Rc2bCW8YqiZik=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkb8Dd97avaLfwaNieieEc8MH8OaFhidLoohM2m
 JmznCrvavuJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZG/A3QAKCRD2t4JPQmmg
 c1qnEACvuFFYBtnYXjqpzSqfhc+GWapoYnfSp0RskRAenBfdgOVdq+TdMNaREvpGPBesSeIOzVC
 yZ5yUH0nPU9O8DH4ZWXWdp5f+TBlBuNP2pFaaHgFi69n8xQ8/sKAT5Lg6vmlRtS/7b9/jDI3gPC
 AP5zEvnUGhACH1F8Gcp8aQYH5p5agqIqpcz7A34G/61ZScSOP2tyGcpcwkVMieVqA64NPFxMqoc
 qgObihAOFWHeJ/S9fTgCcNjPoFfhOFgI9enEJrHPkfjHZwVhw6V5QTbWjxd7r+56vLShxt6Q+jG
 m78CG6q9BrcNHvFfvoAWn9aKnbhD1Q5lKljG1FVlDP3PoE93brUanrTSZuD6+r4WS2yQG//MjZS
 4OkvfwQ18S9CkuuHlE4jefLrlXXezdWM8vqsLOzrwnlV6hbCmQLMuXsE5VR0ny/360xuNg3ConR
 61a0j8TKbGLTuoJQnFnjlcj95BoSnV7tqoudubPxxjwzogRbgdaikTIAEVFHUVleHUWiORlp2HL
 wDg/zZLPffjnypQn+/KN4hFmwdrOtbLTBPG+vv/WAn7B9s9RnHcgRyQbDSyEbZjn1dWAIzxwbOn
 GSiUylI6/hFO7U+IGToUhLYs3LmA6WPq9zl02j5hWMsdT6qGJdpeteOIgITUnwse5kItBn09xPH
 eUTMqlal6wO5XSA==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

It looks like all all link trailers were ignored.

Now we accept 'link' and 'buglink' that were already in the list of non
person categories.

Note that existing test files have been modified. You will probably need
to run "pytest --cache-clear" to avoid using the previous version.

Fixes: 7d1a05e ("trailers: ignore non-recognized link trailers")
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/__init__.py                                           | 6 ++++--
 tests/samples/trailers-thread-with-cover-followup.mbox   | 1 +
 tests/samples/trailers-thread-with-cover-followup.verify | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 1af6993..e9e7b64 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1656,7 +1656,8 @@ class LoreMessage:
     def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
         ignores = {'phone', 'email'}
         headers = {'subject', 'date', 'from'}
-        nonperson = {'fixes', 'subject', 'date', 'link', 'buglink', 'obsoleted-by', 'change-id', 'base-commit'}
+        links = {'link', 'buglink'}
+        nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}
         # Ignore everything below standard email signature marker
         body = body.split('\n-- \n', 1)[0].strip() + '\n'
         # Fix some more common copypasta trailer wrapping
@@ -1695,7 +1696,8 @@ class LoreMessage:
                     if not mperson and lname not in nonperson:
                         logger.debug('Ignoring %s (not a recognized non-person trailer)', line)
                         continue
-                    if re.search(r'https?://', ovalue):
+                    mlink = re.search(r'https?://', ovalue)
+                    if mlink and lname not in links:
                         logger.debug('Ignoring %s (not a recognized link trailer)', line)
                         continue
 
diff --git a/tests/samples/trailers-thread-with-cover-followup.mbox b/tests/samples/trailers-thread-with-cover-followup.mbox
index d9dc64a..bbdeeeb 100644
--- a/tests/samples/trailers-thread-with-cover-followup.mbox
+++ b/tests/samples/trailers-thread-with-cover-followup.mbox
@@ -225,6 +225,7 @@ To: list@example.org
 > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
 
 Tested-by: Follow Upper <follow.upper@example.org>
+Link: https://example.org
 
 -- 
 Follow Upper
diff --git a/tests/samples/trailers-thread-with-cover-followup.verify b/tests/samples/trailers-thread-with-cover-followup.verify
index 6478e6f..b42e1ed 100644
--- a/tests/samples/trailers-thread-with-cover-followup.verify
+++ b/tests/samples/trailers-thread-with-cover-followup.verify
@@ -4,6 +4,7 @@ Life imitatus artem.
 
 Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
 Tested-by: Follow Upper <follow.upper@example.org>
+Link: https://example.org
 Reviewed-by: Cover Upper <cover.upper@example.org>
 Signed-off-by: Test Override <test-override@example.com>
 ---

-- 
2.39.2

