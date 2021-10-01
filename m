Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60D3FDF
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 18:26:19 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id q81so10079734qke.5
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mmmre5hf/CXGb59OFH6rPBkT+0ALrvVJu2chNKTjEa8=;
        b=Rz4ggx94XpHaJ1WwuMlv8QJ84xWhRmEOcoizWsG7rN+Dt386CG+xL+ECAQ2tuw4AH2
         M7RRW9usfM7EQXqRyKI2WGKS+qMo4uA2arlQYMev7jq3Q8ZAUrFJjnn1+VEtcxugnhQA
         RNgoEVswtVSqyiWOdU5qU/nHozcfXQ6qG1AOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mmmre5hf/CXGb59OFH6rPBkT+0ALrvVJu2chNKTjEa8=;
        b=q384IHGX8J3O4hN1iR3PRzw3mPvlzs6GD1AIpa6/MsmsDG+ZfHtbQbBVrxTLlZpQlN
         DKDcVjrO2u0dZGlpJtqFeLy510SDAPilBcbtPdFyFVJzLN5pX6/XoKF8Ki724mIuuj5S
         VKUQ5X/8ayAlXCna/0EXEFa+S1Mhid4Fqb1CUKU3eqCK8lRC9ncotrqA/xvf7JosUntn
         jHfNfaJoOJpc5U1fbrEL9y6D+H3NZd+LtrROvKRnQ9J7X3U2i4adEwYZzjRaqF0UGEpM
         i62PftxakV6oWCjB4h3o31Q+/0U8KKtgk/Suys1RvYIL5cNLaRiTtrQobv+kCKJYScKb
         /WKQ==
X-Gm-Message-State: AOAM533uQBA2c0zADdJFy/gxseS/9X96KCisPmiwVTXx00+9ak1nN7n4
	S3dTk3kDxCsoOB8R86NuvWcYiA==
X-Google-Smtp-Source: ABdhPJytqOImpbwzDJDeG85c7aYUtXdkctvIdFO1okHa+KuqRBwCuO+rrZ0nCJASx2l3O8sdNTWzTw==
X-Received: by 2002:a37:9eca:: with SMTP id h193mr10750239qke.127.1633112777922;
        Fri, 01 Oct 2021 11:26:17 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id k2sm3626347qtg.35.2021.10.01.11.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 11:26:17 -0700 (PDT)
Date: Fri, 1 Oct 2021 14:26:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202109301559.A9BFB03@keescook>

On Thu, Sep 30, 2021 at 04:09:13PM -0700, Kees Cook wrote:
> I think so -- that seems to be sort of what Linus does? There seem to be
> a few templates (tag, branch, and "patches from Andrew"), e.g.:
> 
> Merge tag 'char-misc-5.15-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> Merge branch 'misc.namei' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> Merge branch 'akpm' (patches from Andrew)
> 
> Though I'd love to know why there's a distinction between "tag" and
> "branch" here. Are "branch" pulls not checked for signatures?

That's just what git does when you merge FETCH_HEAD. It takes the contents of
.git/FETCH_HEAD, which describe from where the last fetch happened. If you
fetch a tag, it will say:

    [tipsha]\t\ttag 'tagname' of url://of/remote/tree

if you fetch a branch, it will be

    [tipsha]\t\tbranch 'branchanme' of url://of/remote/tree

When merging FETCH_HEAD, git will just say "Merge %s" with the contents of
.git/FETCH_HEAD file for that tip.

When you merge a local branch instead of FETCH_HEAD, it will default to:

    Merge branch 'localbranchname'

I think Linus just manually adds "(patches from Andrew)" to that.

-K
