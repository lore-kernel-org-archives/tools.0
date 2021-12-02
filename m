Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BD29CA
	for <tools@linux.kernel.org>; Thu,  2 Dec 2021 23:38:38 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id x7so988756pjn.0
        for <tools@linux.kernel.org>; Thu, 02 Dec 2021 15:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCR8fkZR/KTLt029qLEq1YLNY+sRb89/AYMGI6nGFmE=;
        b=h7mlfuqGk1uXnCrVicIIRPLNxF3+W1AxT9PvKZsHJpIvnxi/5CAyGh2piASi20M/Zr
         12W1ytB1p5maayXr+WGE7M6xVZqEjj03m+lrLR/BTh2gWyKJf85yG7QwnTKcdKSyICfA
         I29pGZAWXtQtUjmIpumzFiBpvOfdqmgeEmJrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCR8fkZR/KTLt029qLEq1YLNY+sRb89/AYMGI6nGFmE=;
        b=Z5TocWtj2IaK+/uMFc8ZxvB7OHeVNCdSv8W1H38lQH6NmHyKU83aEngeqCEtNBrS/C
         jNavBK5nl/IxmEC/ZMSOlVbms1OiN1bSd7IuBll/cL2tch5rejTHOxwvSee9ZeJJmFUk
         UKi0TRD9ag0Qm5nUpsLd2xVSY/3eb6RqwrQmgkeiveLIZC08oWVK+t2qqvwJkUQJUHTE
         QCCs9yvikSPpPCb9AEvQyXm+XE0EvXxxXhtv+MnhToISa3WjAjObWzDr4gSNj0JbgltS
         Nk2NuG8EfsYbywbtTya9vEXHzFQ917t/cj6is0XhJdasa0QtI9E9dEdyFw+trIZbhvfS
         YejQ==
X-Gm-Message-State: AOAM5310iYUf1TbepWuijRY+bvxn/p7VpoX8t+wclZ9WAPUJniA983k3
	YkcRJ/t88bicaznesUykU4h1BJVQlcJRvQ==
X-Google-Smtp-Source: ABdhPJxR7QYjO/wdmQ3ll1mDXu40kZDduHQCgwW9oH87L4U1gZEf3czXVEB3QkIHLKnYty+6DzItBA==
X-Received: by 2002:a17:902:9b8f:b0:142:7999:67fb with SMTP id y15-20020a1709029b8f00b00142799967fbmr18678740plp.24.1638488318450;
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q1sm841823pfu.33.2021.12.02.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 1/2] patchwork-bot: Ignore empty context lines
Date: Thu,  2 Dec 2021 15:38:35 -0800
Message-Id: <20211202233836.2024510-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211202233836.2024510-1-keescook@chromium.org>
References: <20211202233836.2024510-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; h=from:subject; bh=ktqmsVg/vyRZ5SA96OeXlHIa+wpPkJwiS3JVVioCwpI=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhqVj7TxmiAxBlLfdtdDJ42xrXLI6tkNaQTQHIHrqA 1Tg7YLWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYalY+wAKCRCJcvTf3G3AJqr0D/ 0SzdJtRXrn4eGsLgiAhrQ7SjE3IuyhXSFga2JgG2q4Hsj9Rt/IHuVbdDmuJZzRqlCC5/lQlYCmF2cx mIS82d7xL4GDGEiHzEefhrERW30aImsoXeMPpK3mknI0ZgXYsyZhhpwLRj+XxrCuaQm76lsozV984m VTQlwnyxrCM1m4Axhr70U9MlTDAYPVXPrZDDDSqaJUn72EbmbnpQrAS8VgaQByyF1aFg6j8RY1tkm1 FsF8LrRUuYODOq4CiBDU7K43IMYsNjHddAPo6Cb+2hsiXPpVHZDp6//pFI74RBsWieZPalJZhCNepf fo+6DpMAUkco83HIERTPyS+w41eb0R4KcyHxrro5xuctNcmEHAs/RA4noQIQb8DqJhvLBC2mxjsU0T IpdWoTTEex/XTmixC58Mro9cCe84vaOlu11WZbE0SxIhplwZVZAbG9432mCNeuJgmkN9z0LUFjzYeS k/+AuNIc/hqrzKrY0eDQWOjh/kxhEBls97PE0/S0bwtMSptgN6QCz6ZgYxIirMU2n16HLwodb7oWtN AegtiNyk0IScWLWJI+bocSQpw1CNUYLtfcp5i/q98XK8xQZfBUJeLBNf4u7Svyz8VgRFYgA/Juvs+6 F01r4fzAHZKlmwszXFLLU6gPUPAWxeEtbY6A5WjcQcTmhkzBoW0NKRUbRHHQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

It seems that there is some mismatch in diff output (or storage?) between
git and patchwork under conditions I haven't figured out (MUA or MTA
whitespace stripping?): patchwork appears to ignore empty context lines
(i.e. a line that is only a single space). As a result, the patchwork
hash will not match, and commits will not be identified in patchwork.

As an example of a commit in upstream that patchwork-bot cannot locate
in patchwork due to a different hash, due to the differing empty context
lines:

$ MSGID=20210911102818.3804-1-len.baker@gmx.com
$ wget -qO- https://patchwork.kernel.org/project/linux-hardening/patch/$MSGID/raw/ | \
	grep '^ $' | wc -l
0

$ SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
$ git diff ${SHA}~..${SHA} | \
	grep '^ $' | wc -l
2

Teaching patchwork-bot to ignore empty context lines allows pwhashes to
match in these cases, which lets those patches get located again.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index 2ebe5b4e88e4..4e10385de629 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -528,7 +528,9 @@ def get_patchwork_hash(diff):
             line_nos = list(map(fn, hunk_match.groups()))
             line = '@@ -%d +%d @@' % tuple(line_nos)
         elif line[0] in prefixes:
-            # if we have a +, - or context line, leave as-is
+            # if we have a +, - or context line, leave as-is, except blank lines
+            if line == ' ':
+                continue
             pass
         else:
             # other lines are ignored
-- 
2.30.2

