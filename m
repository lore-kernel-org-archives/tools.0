Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEC2FB3
	for <tools@linux.kernel.org>; Tue, 21 Sep 2021 20:25:29 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d8so535905qtd.5
        for <tools@linux.kernel.org>; Tue, 21 Sep 2021 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=V+vIyTC4xqxb5F/1dsUETj2uUQozJawT/pad6SYGc14=;
        b=eQuUCsQ2QYESjhENBlaNTMofc4X18v2vqYYuqRnA9LI0MaU2K7fofsAP40Fv5mdhi0
         feeDoaIE0g31V26311vq7VRuQST7Ls2ktjQjWRDivebrTa/KTo7+nRaxTv1Bs5OlsHru
         GhsLOMPQ+91E5mVhGwhrlCOdIUSh0CtIgP0do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=V+vIyTC4xqxb5F/1dsUETj2uUQozJawT/pad6SYGc14=;
        b=VgyTrV/saqMYW6MzFkGZhMHrJRsY2S/DOl50qVZYb0XJTjqSWL8uzA3b5qpWDL7mXO
         9gvTdGl9rWtj1ov8Il9B3ryqsPiHgv5Ashh7Ie2d7TjnZ1Gds8SjxrdNumy6SYU3kxvS
         EbJt+Fjzlh/2hOGo0I1NZJXl/YDl9spBrK3UDKzataAM75hpX6cJpGeLXIC+QSjdqTFi
         mJMz9+eBJCLVp2PhE0+fzomhPXpJ9+//Cy6Q1H9B/IQ/ynRvG5Rj7UuzgxlpdhgTL5L+
         gWA0u8UDL1bl9/5x1Mana7alGzmazK2Rs6jyaBIJDa4Mdd0yYIxGwfxAS7YreZ2rd8lJ
         TupQ==
X-Gm-Message-State: AOAM532un5MooeMSCjrkP+hY3bDTR4I7gYJhsDjKGm6v0fgnZ01+qDFv
	H4ybNN7eMDx7NjK/RT1Ode+03nvNzjtsnw==
X-Google-Smtp-Source: ABdhPJzQ466WTswTHSIMAaLdIwhasiUeGAmx1yYWzaXX14lGAlEVWiJGUpfNr2TUwCHwMukwgsmyZQ==
X-Received: by 2002:a05:622a:1908:: with SMTP id w8mr30407953qtc.269.1632255928665;
        Tue, 21 Sep 2021 13:25:28 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id q24sm42735qkj.77.2021.09.21.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:25:28 -0700 (PDT)
Date: Tue, 21 Sep 2021 16:25:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

The current master branch landed a new feature that implements a new
subcommand "shazam". It is the functional equivalent of piping "b4 am" to "git
am", with some extra safety padding.

See "b4 shazam --help" to see the available options. You will notice that many
of them are exactly the same as for "b4 am".

The default operation still tries to be the safest possible:

- we'll create a temporary sparse worktree that will only contain the files
  being modified
- we'll use the base-commit sha, if we find it, or we'll try to guess the base
  commit from git index info
- we'll run "git am" against that temporary worktree
- if successful, we'll fetch from the worktree into your current repo and
  delete the temporary sparse checkout
- you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
  or "git rebase" as necessary

Alternatively, if you run "git shazam -A", we'll just run "git am" on the
current HEAD, which is the exact equivalent of "b4 am -o- | git am".

This feature is fairly "raw" and lightly tested, so please expect things to
potentially blow up all over the place. :)

If the default operation with getting things ready in FETCH_HEAD is not
useful, please let me know how you would prefer to see things work instead.

Best regards,
-K
