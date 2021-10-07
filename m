Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D92C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 16:58:05 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so7358593pjc.3
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7VTni9GoCpDz07IhK06JnIhfoo9DspmsNwZkYoYMQ+U=;
        b=crbwMPuOPSIgGM7lpS9AQOigh64Dbq8l/HLnUYq9xfq3gLq6V120ZUjd5M+6glX2r4
         98sUTD8OH9qIyUqh1SXW4SXMfFONntvI7uB1hXSFkPeTBHXDVTax8UCfLTWlGN4jFDX5
         uhsx0klLMSbg/1AVoqvlPRmcF1dAANiIHl3Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7VTni9GoCpDz07IhK06JnIhfoo9DspmsNwZkYoYMQ+U=;
        b=sm25Nr/UVDycJ2111hy58ESI6V+L7+9Ja8LRUko5ZBD05oep0I0pJFH5/6+3+BY/bc
         G80bVpl8SFAAk0TQBExVug51Pl1Sb2oTxvbWWwKOqNplPNwPzQOv6R33V649NgpsVnxQ
         ePI3RZqpWsphF/CFECWCnr4UHWf4PdYwrtH1mVp7x9KgJ/qww8ZFn1p6JxZIykGlm+WX
         VkHd4euOSp/Th+Mnmrf4unEBClmj/SK6lAYH4e+LkfeStxiVR2mnQPghEkhWmyV01IBA
         aXFgJ4egZzeIPelvMJUP4kQDSO5lZMNz5TQTXVgBmw9ms20A1w6q/iUExIV+Y06XmXWD
         t7JQ==
X-Gm-Message-State: AOAM530++uJLyMvX/G5gcAr0EH5JjpRvt7J2jAZsWFtTs3CQrgLYBd0K
	36PG//mOGDTMp3Wx1kU85151Lg==
X-Google-Smtp-Source: ABdhPJwXmLARRJHLu6DMZWToLhdb0ANx4IwPAxYNKV6iIyIT3XbXr9bVN0Rkkrs0jtoL/6gyD8Bpsg==
X-Received: by 2002:a17:902:bb01:b0:13e:a6e6:9a53 with SMTP id im1-20020a170902bb0100b0013ea6e69a53mr4808861plb.4.1633625885200;
        Thu, 07 Oct 2021 09:58:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c12sm112701pfc.161.2021.10.07.09.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:58:04 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH] gnupg: Add gpg status output to debug logging
Date: Thu,  7 Oct 2021 09:58:01 -0700
Message-Id: <20211007165801.2313136-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; h=from:subject; bh=Hm1vKyebRI8NjvzpuDN5bw/1K4RVAImUcF1ZXNmPGuM=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhXycYaqTmu22p+C70qB8a3gwx9/z6tCg59TjO7abH 7zAcKJaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYV8nGAAKCRCJcvTf3G3AJlaCD/ sGg82m4SVKgn2jUasg5rxv+3GLAAWFxvjCRMt6/coOO7MydORO/afn9mwVWZPabpW96vRbVhh0Mwqe nJZWKMRj6ubljA7hWxAXkuZY9jvIWZKy5b4PG2TH5c6cVzOMEBhGY+EqUaIp/dE+m2aJLcn7oZaNqg rAScq0Rr/pkHcBMm3MElps9VQzEAz0YWjBGf8i/867vQ6eWDsnPJ1wxzySPs18eOhNAJRqGXKxCVLc qhyF5UeGvBIxkK7JUgPeclpzoycEes9UjLEb+b8hthXmlcY7gMC0Xlk3brhtvPKfq1p78hUtQanuCC sx5NDVXbo5ydobn59PXpx6NhbL+rvvkAuf6olH6IHPjjpAAmzaq5TKWvNzkq3eGFNURYHwiwxSX2Au SDToWXnfldukzUMyjEldOZ+KGLp4TPl1FJD8NRk0jhwz3xHjttJuJ1HvVptPzRxc/JBPUYlE5Y7cCs +oHBnZgimWsnPLAnX2gEKRpUAvee6SeJXLGx3AgYs5v0/90vgY3nqTuC9Z2/gEEdpvuaBKL+IsRxeP IOg9gE/Zg1y3y9wOj8AxGlBnSmP/NiZxizPu1Hxg91ebZN2t30rb7uX7/rPbZQ7ypS6CqkezLghZbw m6AxLOwSGvqU+Sc0XFSOGxb8szLFrJjCclNnqWgWnTZQlbsC/cbVf6jejwEw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

There wasn't an easy way to see how a failure was being determined by
GPG, so add the entire GPG status output to the debug log.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 patatt/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/patatt/__init__.py b/patatt/__init__.py
index 2e33bce209e2..6f4591973751 100644
--- a/patatt/__init__.py
+++ b/patatt/__init__.py
@@ -371,6 +371,7 @@ class DevsigHeader:
         signtime = ''
         signkey = ''
 
+        logger.debug('GNUPG status:\n\t%s' % ("\n\t".join(status.decode().strip().split('\n'))))
         gs_matches = re.search(rb'^\[GNUPG:] GOODSIG ([0-9A-F]+)\s+(.*)$', status, flags=re.M)
         if gs_matches:
             good = True
-- 
2.30.2

