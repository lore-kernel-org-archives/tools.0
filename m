Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2029CA
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 02:35:09 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id r2so11049944pgl.10
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 19:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BZC/M4WWnfGlaH5y8JcrcRtTXHZKNLnnJQi6DJaQXD8=;
        b=d6kl7ZtT+8eUhhrAhrz3sTMKl5YdIJonVkNyP8TQyf7jlUCLXOpj9T1IiPmZObqnaL
         tsD9ChZMERMcZw8Z/X9uc7nEu7Z0NSbZ9bdpp5jNDPRIzU+bysLnwQWn8ccmt4EUScjx
         mHRyBSyVVwTWTkb5hymdxz77hfZArkH7fRDIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BZC/M4WWnfGlaH5y8JcrcRtTXHZKNLnnJQi6DJaQXD8=;
        b=6dTBabiWj15OdfVvQy/Jz24btgP15qEkRnw8xZB9KYHFUDZrg5QJ3RKy6dtX0AXHTq
         BbQQxAHNAn7rEyw4mB7kSBsJV0ouaIxYcn91koXJx1vLScq1hitZw72BKR5FSrQO3iUu
         7nvBp7Aqzk9VJGDarF59JBuhLQiujuzE2FQeHNVPlDFzZeVUQwyLLcgn9sdXp9QVyBqf
         1L114j3pQe9hty4/Njw0Ba/BtfmWht5c5O6gR5ytSCIDsuvglYxka47F5P7hGY8tXOMJ
         485tkI/LUvU+0GKZFaP5KawrwHzTMlYplp0JVBJnxgOrAg3efqncogQ7miyWb1+hFKRQ
         QsPg==
X-Gm-Message-State: AOAM531OKuQhaqIYk109wLECtpLwQrzy0P9MrzrwuHDgkfk8KAMtHEql
	iXoq3KDSUHqeI43EGEw5s5c3bSPeJ+VOnw==
X-Google-Smtp-Source: ABdhPJyTdArZUUm2fBH2tehcmFAGYqE25oo7ktwF8aFVH2fV6lzE6qMC+TgCKvsA8krlVWzwtmWuhQ==
X-Received: by 2002:a65:6213:: with SMTP id d19mr1156763pgv.110.1633142108710;
        Fri, 01 Oct 2021 19:35:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e15sm7257084pfc.134.2021.10.01.19.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 19:35:08 -0700 (PDT)
Date: Fri, 1 Oct 2021 19:35:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011907.6526BCD1@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
 <202109301630.C2646F8B5@keescook>
 <20211001171942.oyq7qtly64tyqi72@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001171942.oyq7qtly64tyqi72@nitro.local>

On Fri, Oct 01, 2021 at 01:19:42PM -0400, Konstantin Ryabitsev wrote:
> I don't want to wander too far down that path at the moment, but it's perhaps
> something to consider in the future. With patatt in-header signatures, you
> *can* perform attestation if each commit includes a Link: to the original
> patch message (and that message is cryptographically attested).

Yeah, just getting more folks using patatt would be a great next step. :)

I've proposed adding "patatt validate"[1] to the netdev CI[2], maybe
gfx-ci[3], and others could do the same?

-Kees

[1] https://github.com/kuba-moo/nipa/pull/5
[2] https://github.com/kuba-moo/nipa
    e.g. https://patchwork.kernel.org/project/netdevbpf/patch/20211002003706.11237-3-xiyou.wangcong@gmail.com/
[3] https://patchwork.freedesktop.org/project/intel-gfx-trybot/series/?ordering=-last_updated
    e.g. https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/411177

-- 
Kees Cook
