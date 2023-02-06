Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E115CAC
	for <tools@linux.kernel.org>; Mon,  6 Feb 2023 18:23:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so9564441wms.1
        for <tools@linux.kernel.org>; Mon, 06 Feb 2023 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW46Ma9yTEjhuITOC1uxJ6XrkvLvxD0yfEKFV60Eg0w=;
        b=075/y7+fy3jmZZ4q/wKymaAzXAqJDrFfC51NxFWlpHHplR+o8/uq7NRpWp+InOkBCp
         XzI1aa2F4GI6zH7713T2O7qNyhN3yuPngXxMfVglYNKFd3JMfDw58CZi+35AlwZ7mWWq
         MR1C+K3JL/pWiO3kQiJO2N2PDw85vW4uJ7FA/9ZmJVyobOJLq6S8+4KTdNwchv+XlqRG
         Du9GzVH3aTiUbtBTxXn2dCxIObr+NEwtN+vGmiEqPjXFU5MnRyu1coH0qmCAZGaNlpDV
         cejNXICAAz1/ZXUaEKPXKDMD9hSP4yq1AaTLSIvyGHTiHzqceFF/mwVWmbichefk73D5
         CrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW46Ma9yTEjhuITOC1uxJ6XrkvLvxD0yfEKFV60Eg0w=;
        b=W0hCmqR77lSUOfXU3j+I7/7RgWhnkrKPWi3O0sYMkjrLjmXJkKUWUo4X0dsT5pvLu7
         +uaD0cD6JzWX9kMuzkMRre6QlzFy4dpaIYxW2xJgkuM2MKL8EDSyJf0BUbFmJy4og8p7
         YFqCFoEOtQTseO5tSXQnekD5+mFvfk7DGdentmX3VS/7pkLotNR2l0OPgdoMB5HhiSuA
         MZGP1PEiaBTzZZqaTJlDeQPLNj2XPYzrld+ZT2MC8hW7ku6BHA09kX4suvfP0hdK+Ljv
         bU726kv65vllu7PYKZCtGB/a16Sj++oNT9T1+wVtXGB2TRuUa0lJBLzodeUXfOf79NrO
         Dc3g==
X-Gm-Message-State: AO0yUKVlgi/OtI1eFXaNKH9b/HS9LJCitfNPzd7LXVIkmkjM7rEVXmLQ
	JBAnrduLRXf0lSImR11v1IITC0019Z1JPptZvYg=
X-Google-Smtp-Source: AK7set+2Xc2qT/42BahhbojNn5PtYBA79ou7qjD9g9rddxMZupwoZU34ixZutyFxN6LeDj54w+86jg==
X-Received: by 2002:a05:600c:4d16:b0:3df:e549:bd00 with SMTP id u22-20020a05600c4d1600b003dfe549bd00mr610803wmp.1.1675707813207;
        Mon, 06 Feb 2023 10:23:33 -0800 (PST)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm12871588wmc.4.2023.02.06.10.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:23:32 -0800 (PST)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Mon, 06 Feb 2023 19:23:03 +0100
Subject: [PATCH b4 RFC 2/3] ez: prep -n: always use fork-point as a base
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-b4-prep-fork-point-as-base-branch-v1-2-2732e0c32f5d@tessares.net>
References: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
In-Reply-To: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=BcmRyqQ/7rRSGHfGgb0qzOeyroQfraqKa3aSSyWrDU0=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBj4UWi/+WXP4AK3EsAe8G7GNb/wFJ2bJLpqIkXP
 PUGtWA6KpOJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCY+FFogAKCRD2t4JPQmmg
 cxPpEADLZU534EN9pXDJMns2Ic4IqbtdGleQ4cxGBUXYnQyG2NNQr+RPA27RL9jUrT2kMzLRn/d
 FgS52nwxp7GfZe2ZOcebP3KkKx6FtdZ+plQF6YzxNHc9onSH9hdahu0iEwi9YkI6KegNNQzDZvQ
 y1U5LS2NmqS/qOzJaGHOMuBk6YQEF15I0b7C8RBdBxSNTFxwXs/SJTS6OIbH2sIYQhn/0LRTzL/
 /b64FqVYpKqIvTiTk80cCuZFmwxQjkwc2HHo+5qT3tnnqln003uU+zeZPIT4MqB9e3Se4o6ltCz
 CmA3cngIsAVkFKXd1a16nFe27pJwqqT02cVg1Gif/V+tRpjdLFJCTnsh9HkPyWDeUp5wez/XLIw
 CyDKfMxB2k4cdk0UVpiAB2E9oYMpHXCXX0JGWd5ttkLbpFnZs2f5o7rVkSqlxepZJu8tfJWS6hY
 /EI+dtjplLmvwSuLMwW+qnI8XbUGEzmVAW3d79aPjX8fCHStnkySiNb7zWcwZz1Jcmc9alhkCdH
 Z1pn+obi9dM7HVZBCTVS94youVCGuEEAl4aRbzbbfol2/AymwEe3yL2O03/lb1IDnjlIDKrBEzF
 NSmY/NAR+L66zD0BrRMnc30AI/FELCrf5Y5W/R0gXXlHVK+8pFTim1XIMKCq3a6utnyOoXnw5Id
 xFd9GzAq2X/0vOg==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

It is unclear to me why the current branch is used when 'fork point'
argument is given in the other strategies.

The explanation of the --fork-point option seems to suggest that this
fork point is will be the new base branch instead of HEAD. Then there is
no reason to look at the current branch which can be something totally
different.

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/ez.py | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/b4/ez.py b/b4/ez.py
index 2722c6c..9200d03 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -328,29 +328,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
             cmdargs.fork_point = 'HEAD'
             basebranch = mybranch
         else:
-            # if our strategy is not "commit", then we need to know which branch we're using as base
-            if strategy != 'commit':
-                gitargs = ['branch', '-v', '--contains', cmdargs.fork_point]
-                lines = b4.git_get_command_lines(None, gitargs)
-                if not lines:
-                    logger.critical('CRITICAL: no branch contains fork-point %s', cmdargs.fork_point)
-                    sys.exit(1)
-                for line in lines:
-                    chunks = line.split(maxsplit=2)
-                    # There's got to be a better way than checking for '*'
-                    if chunks[0] != '*':
-                        continue
-                    if chunks[1] == mybranch:
-                        logger.debug('branch %s does contain fork-point %s', mybranch, cmdargs.fork_point)
-                        basebranch = mybranch
-                        break
-            else:
-                basebranch = cmdargs.fork_point
-
-            if basebranch is None:
-                logger.critical('CRITICAL: fork-point %s is not on the current branch.', cmdargs.fork_point)
-                logger.critical('          Switch to the branch you want to use as base and try again.')
-                sys.exit(1)
+            basebranch = cmdargs.fork_point
 
         slug = re.sub(r'\W+', '-', cmdargs.new_series_name).strip('-').lower()
         branchname = 'b4/%s' % slug

-- 
2.38.1

