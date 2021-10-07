Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881D2C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 16:55:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id y5so4342027pll.3
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9g615wZMCHLzGzelGSGx/rUpkzvPRzj5+5guUb1ZkI=;
        b=QsTMXhbwtqr8KkDL11VfC9bZlX2/grAQU6krjD60LIkaPX4lIo5bkRKziSH9/NqSDx
         LH9jUrA8OjWIER8wNcxBF1xUlTT1eQKYPKHSXTev5bzY1K8nacoedLC6G9cigEgUPo/N
         hItlhspIEEixEbEF5U+bZlBYDwyorwlNFXS7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9g615wZMCHLzGzelGSGx/rUpkzvPRzj5+5guUb1ZkI=;
        b=SpvRXfyVhtfs4V6HR89oYfz2Kikf4KppUJtdrxnePn/Sjw3d8DVNc2AmwOLYKsPIBL
         BCLwZfcbcaRsrC074ievmYwnj6okkzVvTmAdsFYPml4OeN/sKWaThdg63SxauRlbuHud
         xIELV/ifrif7bW7ZXlRTYA5UiPDUWC67o0VKbsssqkdMFdgVMcXPxcww5eBPQR5npXeu
         uBCZB7DVwNPM2Vn5MDiHmrtHnN6kiD9seb/33I7yvzmkq3Rp6o0i3Wm2OdY2GicX2HTZ
         44jjgDW3Ib/1a9jIkNMD67xOH7gFma5ijfxbApQd7aGs2b4/oZbkxj/NZ3vKnc2nnppf
         I9oQ==
X-Gm-Message-State: AOAM530T5u+5MQnYHkOEKeLIk+XjsowzhgrgF/QeY8OLl6153issgMqD
	QElKjxJiB/PsNy4FHRzKWbZNOA61ihTQug==
X-Google-Smtp-Source: ABdhPJzEnc/a3e+EAJYXKCRyGguVIemRCZyRmw0X2lnr2dz3KzrUDyjYCuG3Oq/24QFr5QJFTscCdg==
X-Received: by 2002:a17:902:a3c9:b0:13e:2e41:2a76 with SMTP id q9-20020a170902a3c900b0013e2e412a76mr4814246plb.43.1633625753613;
        Thu, 07 Oct 2021 09:55:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u12sm8715861pjr.2.2021.10.07.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:55:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH] validate: Use patatt's configured keyring as fallback
Date: Thu,  7 Oct 2021 09:55:51 -0700
Message-Id: <20211007165551.2312946-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; h=from:subject; bh=KGHxdF2iSx+pcXp7hTFQHyp5Pod6ZPXGvbK5IEAU61Q=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhXyaWv55Bwp25PTRs+4VGUrFYxzC1YXCVEmJ8RUql TLFtvAqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYV8mlgAKCRCJcvTf3G3AJhcfEA CErMhXr7mmjQwPMqTciGQtSSavRYaQhcDMzTrftj8nsQKN40SDKM3FrzxROaMoaM2zJjpUf47xXC6m d2xhkrEcYrML9ogKn1iaBW86+PDTZNGAxBscG7k4GxqjADK+tJMhmp7AByh01OmLjjX2UfCklq4JPS PAtpY/Ktu32pQO7nPWqC5KchkLndhCgGWoxwcVxh6YwBjTbXs6LXxGl9Cym6mcXzJFDOkcKgP5M7uw yxMLRTkKwhcyOZW1qiBxwIspi5tUkrSBzDJwF8zakOU/xf9Ah/JoWVgHyDI75R5ORX1bqX4/fNf9d+ 6J8vJvZthfgmR1TKnbhtIysTaYGGpl+JgrPnIAMqfCCWmAO3rT4w25EcCYP+UDNwmY8nDILFj8dyOI 2Pcc5OEeLyguRBMzOvGE0xj+U6tJKvjHDJhFm7Ae1MigzYcH89M44+e9OOeIeatxUIj4CiIaRVTTqi qB9/cU4yVWqU092+1HEX1L5Gmu0MjIedq9prhkzPrFKD09l1hfVzp4BeZh2c+qs+bSuNdpAr8+M6wK FVaaN+RJc89l0U1h0W/kFaB/wpWJXGHbXue8pfN+G5469SzKCucj4tOgfO3IaBiY8dxiahcILsQ8KQ pDdGFq0kHZwCbyUr1rvPGEtI6GovWKWvRkETmXI3bbvkMvFpRlRdKWK8Xjnw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

If b4 doesn't have an explicit keyringsrc configured, attempt to fetch
it from patatt configuration instead. This avoids some very confusing
situations where patatt would validate and b4 would reject. (I had an
expired pubkey in my gpg default keyring, but the same pubkey had an
updated expiration date in patatt's keyring.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 b4/__init__.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 47272bb4bdd7..a895e3a6f4d0 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1117,7 +1117,11 @@ class LoreMessage:
         config = get_main_config()
         sources = config.get('keyringsrc')
         if not sources:
-            sources = ['ref:::.keys', 'ref:::.local-keys', 'ref::refs/meta/keyring:']
+            # fallback to patatt's keyring if none is specified for b4
+            patatt_config = patatt.get_config_from_git(r'patatt\..*', multivals=['keyringsrc'])
+            sources = patatt_config.get('keyringsrc')
+            if not sources:
+                sources = ['ref:::.keys', 'ref:::.local-keys', 'ref::refs/meta/keyring:']
         if pdir not in sources:
             sources.append(pdir)
 
-- 
2.30.2

