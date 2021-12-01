Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD42CA1
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b13so16279163plg.2
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NePa81kB163QyHEWq9gcWkRRPDFvgTP+CZOUP3wpTAs=;
        b=NfQm3HenJosIN6/6SeUZHKvKD84i6sy1WZ6VlrD3WOM2n9qVcv3KfsUTSt52pf0UHS
         D4JDjhC5679AgyCnmtHAkJyvDBfMnqU/2mYo3ukI7jcEF+TMAtHN8aS4pzhGq02mokrF
         1soLY0Hy6TZQKn9Xh/T8Ip21iQp9R6X6YmHCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NePa81kB163QyHEWq9gcWkRRPDFvgTP+CZOUP3wpTAs=;
        b=iZjN823YoxYv5cUpPFNRVeIpbEt7aZ+IRw1SOBeAu1AzkU6dLXK8x88xnFS+RvhUGN
         ozpE/iNTuaJmnn5J5aLAJpbo0EtRDw4gWBiZlo2yULkXpLGPA0VN/fFRXuZWs068YYeh
         HDbRGw6Faa3dbyh/fZuq1pOUZ3q61BrQ8JxxAe7KuXt5zATk3tWM4eaw58jFzHzgqMkc
         ck21ZIxRrpbca94qkABAPIno7y5YgcPiFcyUnYYY2ps5s3dQh9x3jSG6BHoHUKaKdCBx
         yf5IoYzOhxHyafHyOeVU810THdYWPlI8K6LIN+5VEDVol/eZrUucH7nNbx85vxkUn83T
         3n6w==
X-Gm-Message-State: AOAM531Qp6DIP4XrI24iVwljkRZ3yS8acauEj90KDegjpv86f25Kn6gk
	j+NEOSCBznmQyA95K/vgO33Ojg==
X-Google-Smtp-Source: ABdhPJxcboJQz4zj/jrn/I6MMfY+ERW4BktFNHCx8rDURPWQQYaj4BwDV5HuRNIjdrhcwMxsVi+AVg==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id kb17mr2969544pjb.124.1638317489056;
        Tue, 30 Nov 2021 16:11:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id pc10sm4176314pjb.9.2021.11.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:27 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 2/5] patchwork-bot: Create CACHEDIR if it is missing
Date: Tue, 30 Nov 2021 16:11:23 -0800
Message-Id: <20211201001126.4106635-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; h=from:subject; bh=gYNuSa7CqDWoxRa1ApTz8/BbWHcKZPnU0x5DRNkf8Ro=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2tPWQk95pGxYLnMC+fxBPRQPuNOBO57f6kdCaa GY/O3jGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rQAKCRCJcvTf3G3AJs7uD/ 9x/C3ODaGesG6NUEKyRRiro3rlv1S1crKGm65Pyu8WbAIg3CVIjcdIIrqEw1j8sLN9z+M2a9wUq3Zl drm1jKGwJVeBq4ad4R9hasTUXOQe1zOUHayu2mW/5kFCfoQ485Z98cCHvrusyT4mdc61QD++6USX7B tZgoC1ffEfxgJIZruOXEytQuR5YqhjphMtdZ8Nd3d0VfcuhfMcTSebl1XcAkTEQT8pvB0vmfwKLg4N hSUWrMhcPddVXK06shTeGUaU8y0mbO3cOJ2TA2yINULFFO1MgnQMmMAh6o8JhwHlpHfKE7sfgB9d6u N2mWcB6BhBm+Nd55cH3NaM82JHcsMuL4HqMANwa8/hUxofOkiyoLhIxeW6rBQwkMPM0ZQuWJSYoIwr Z9eXFFCP7P2Z7KXK7rmntwpvinGIiTq39fz0OLW+xsNP+fpU8heBYcymMYLenddapqxDldkIZegVgi wcv6UIzIFi5pWWMfx71Tyf+540e+/gG3tCguEPndU+M/7uFpohjIUBfxodX4fNo0YHTSM4rIlBzGB3 G8ceIjEc/paWGDfz9zAtHMridAartuS8t4XxiVWhAMZgiEgZHsU3NUlhFefUMCvvc6Sobe+KV8Pgl7 qoaxcbJHIOFgnF43Q7NjLrkObMJlKCbzRQ6bc+DPTVIJfZnF0pYdg8Z/P0cg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Create the CACHEDIR if it is missing (e.g. the first time
git-patchwork-bot is executed).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index d1eac6c0c0df..dc10fd0effa9 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -1375,6 +1375,9 @@ if __name__ == '__main__':
         cfgyaml = fh.read()
     CONFIG = ruamel.yaml.safe_load(cfgyaml)
 
+    if not os.path.isdir(CACHEDIR):
+        os.makedirs(CACHEDIR, exist_ok=True)
+
     if cmdargs.housekeeping:
         for _pserver, _sconfig in CONFIG['patchworks'].items():
             for _pname in _sconfig['projects']:
-- 
2.30.2

