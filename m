Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E32CA3
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:29 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i12so22351408pfd.6
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bceWDZcaOkyzrGLd/xGMAmBBE8fXa94zLV20HlyIv2o=;
        b=DX9f0RLSwnVavTPKwfaC7eWZL0kUJezFMxTYlG58xbho9/IbYnH7fBdj2hw3ukwiPS
         HpZmH+Qz3UlvKrkmoyH33X4rGUsHlW0+KEsEN7DSMMjjMLBBhU/NYnTQirEvqJq/rj61
         3zUVSSee3ARFbSp0qF1ms4BQU2v2pPK3hlpWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bceWDZcaOkyzrGLd/xGMAmBBE8fXa94zLV20HlyIv2o=;
        b=bIPpQGOG7NJVatTvIcvVcwN0/B+oNf8iwjr+5YpRFGS3ZADT/olknh8xyAz7h7sxJ/
         oOKcDEcD8b7HjQuDMcQsb7K7rfKv+s+2lu9bbY454+9kEMLbJAoc51Ko1LUJslKdZ7M4
         vmITzPaehFzW6b163m6Fo5PYDcTSzCcyQ7NseBVBkQSESYzclSawdWeJ0Q+UMTyLF1Yd
         JW371i9GCe8ql1be2zm/eTPm2q2fmTz/WYD2kkTbOaNv+ytJCsak8uleNL93t3ws18uo
         NZEYrCmnbYPdjR38X4r7BMYTXUTqSxdHRMt9ACdkHUqw2ORn3CQSRjFeKOHSZeUOuL7O
         KCKA==
X-Gm-Message-State: AOAM530Q9GVRAVK+p86L0c7l7NtLcgCMERtKHOOnPdLQKieNaGXNjn0k
	1Y2ldy1mL9OcE3T4TCJEPXFIXw==
X-Google-Smtp-Source: ABdhPJwTd3esRg+rXNxjeYOx3zt/eB7f8lnYoBu5TL4YXZsXFkgaj7M8awLQv8VGa8xw5ufwW/pRGw==
X-Received: by 2002:a63:f91f:: with SMTP id h31mr2030519pgi.538.1638317489240;
        Tue, 30 Nov 2021 16:11:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k129sm16702922pgk.72.2021.11.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:28 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 1/5] patchwork-bot: Note which actions are part of "housekeeping"
Date: Tue, 30 Nov 2021 16:11:22 -0800
Message-Id: <20211201001126.4106635-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; h=from:subject; bh=p0nNJyqUltsslCjTRN5hzN2nMrpwxjIPM92Rf6CW+SA=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2sdE7idsEDPg/Giv5PSItmNdRq/qdDQinvZSJT 7uht+1aJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rAAKCRCJcvTf3G3AJgHkEA Cwb7Ky8w036xFQWmGtnm0rHHcvnm04kBUJaCe4mMw7Xk+1ND/36sNHQzS9Frj9N30JMVK+6V27F/rH AAfmXaoGWYJ3awEn7LrGvjaKHffw2dDRL/wmkkf23oaCs4mwZzWC7oOmaWz/8Hr+Fru1zKs+OCgkiz KGoUWXDpZqvlPwKCErTEvEzMEZWXHnAEEj9Xg/pNg8WBsdgGMARIsKdzdL7IqdCP7bDYFNn4iXB9MO Qi8LPtgnb+/2h1QglJsrxhW2lgs7gqJ+lC6nbkjIOeB/K2w7+A3pX4ynyvdVYcYyjw3dCUf/1FDzS9 HmdVKNwv+/iJuVHGWIQAWtMGJjty0GAK7+JB6Xcc/AKEtLOZL2r6NStbkM4sdDOysayDN3h292ehq9 hMtcVDUKnaxaFTbTCWfAnz2vSEE9Zg4R6OXAh8r1JqvF9KtH40BK2Q5YvbhoGcKZVQF74twccxODQo ld8R8SMbe7Hpyn2NcIXwyUSVplqvK8EXZKuQBfm2DOwgqHe8iRX1vW5IPJLpH3AphHb4KiszvZjOId /ZT2KsHSlylLc3+iuIek2e6Fe3qVpfaizaoc1UxtXhHzacuSzmCyDtgEJVGsGvzfDmO1oRJJG+V7Zg Ni/Lr0G4Hh2Fs7g4kdjtqZfFKPj94vwK1O3KT+9imaNSHokVLIDhL9nTcIiw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Expand the --help text slightly to remind users what things the
"housekeeping" option does.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index f87af6ef41d6..d1eac6c0c0df 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -1325,7 +1325,7 @@ if __name__ == '__main__':
     parser.add_argument('-v', '--verbose', action='store_true', default=False,
                         help='Be more verbose in logging output')
     parser.add_argument('-k', '--housekeeping', action='store_true', default=False,
-                        help='Perform a housekeeping run')
+                        help='Perform a housekeeping run (supersede, archive)')
     parser.add_argument('--cachedir', default=None,
                         help='Cache directory to use instead of ~/.cache/git-patchwork-bot')
     parser.add_argument('--domain', default=None,
-- 
2.30.2

