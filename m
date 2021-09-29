Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930C2F80
	for <tools@linux.kernel.org>; Wed, 29 Sep 2021 23:30:55 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 138so4019587qko.10
        for <tools@linux.kernel.org>; Wed, 29 Sep 2021 16:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zciESYrp08CqCc6skEB+3nqPeFTYvNyFyg0ff5Kz/mQ=;
        b=HTEdrXHWEwgdXEtcyfjhZmAuCL9fKeHgytbtRHKTtu1ftpBs0ECHwdv8QqYBEKmQgB
         4HtXTwTPh7nV5gvri7Glu0wvn8FDt8gaE2HDjcs2pV9xZV+6wIFwI5WIPjRNZgboZFg6
         IMkbpzlvqvvmhGXjm+vFIxpjDAwR3lWerq+ydgsaSDJbF1qqFPwVzZEIe+/KomIiqAFp
         HWlWXsitL9zApK2Crm8UPbQRTqbqX/jaIVaCu/NUzEt0veHL2wo7Wzi34eriSPvkCqOp
         mQ6QrFqSIBes6c7yuJFytfklEjzdZ+wN8Wf4Nx7NiG6uu+WrPOXu9o/9I93Gkad6BVil
         PXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zciESYrp08CqCc6skEB+3nqPeFTYvNyFyg0ff5Kz/mQ=;
        b=m/Ck5SZJ+s5t3Fy5Ix+ATZ0o7Ypz4SiQLR028oIndMvR3LIiwmjH/gEof2xxKrHtWg
         mGxmM9izYIGSdI+sTW7H9rUVv7HIsYUiC97NlIVMUIhB64lhVWoE1RiaI3RnyceVi201
         OBHsalv9+cpa0uDx9rh7DD8hN3eWZhPDu3hTGQ0u6OGQJ81DgtejDlFk+uNzgC4Ver0z
         ena/9HuJdqzs0bDWDUUc0DkPCJr+GTjAyyRgVLK+W78vtvSal8LuHJJKpTuItHRfDXaT
         l3OnPZLAs9QA00/ZOKdtAt9A477ToNpCvxaCe73NNirgL3GEMlLjqOGQH14InJfK1i7f
         Jcwg==
X-Gm-Message-State: AOAM533ADuAvfaEAIixiWw4NDREdFfnBl1KSbZ1ofwn7FpNlQc0g7Vbl
	MoavlEOV3cWanAZ1eZCyD83/BQ==
X-Google-Smtp-Source: ABdhPJy21dZl1RgIU8lTMvJob3OvIYYWS+PX04qDK8ioXcoNy9AcjZeW7+2NpQMlYZ+09J05bl2tEQ==
X-Received: by 2002:a05:620a:238:: with SMTP id u24mr2218486qkm.404.1632958254995;
        Wed, 29 Sep 2021 16:30:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id d82sm702130qke.55.2021.09.29.16.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 16:30:54 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1mVj2L-007iq6-WD; Wed, 29 Sep 2021 20:30:54 -0300
Date: Wed, 29 Sep 2021 20:30:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210929233053.GE3544071@ziepe.ca>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
 <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
 <20210928174653.GH3544071@ziepe.ca>
 <20210929211827.5yvedlfq3bia2pk7@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929211827.5yvedlfq3bia2pk7@meerkat.local>

On Wed, Sep 29, 2021 at 05:18:27PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 28, 2021 at 02:46:53PM -0300, Jason Gunthorpe wrote:
> > > We could, theoretically, do that, but you'd have to remember to pass the -F
> > > much free-form and there isn't a sane approach we can take to automatically
> > > generate good merge commit messages from them, short of quoting them fully,
> > > which will be overkill 9 times out of 10.
> > 
> > Since the user would be expected to revise it, I think that is
> > fine. Just make the template and push in the raw text and let people
> > edit. It would still save a bunch of time
> 
> Okay, I implemented something that should be handy. When we find a cover
> letter, we will prepare it as a template merge message in .git/b4-cover, so
> you can do stuff like:
> 
> git merge -F .git/b4-cover --edit FETCH_HEAD
> 
> I will eventually make the template configurable, but for now it's hardcoded
> to the following format (using a sample I've been working with):
> 
>     Merge patches from https://lore.kernel.org/r/20210929143600.49379-1-david@redhat.com
> 
>     Accept 6 patches from David Hildenbrand <david@redhat.com>

I've been following the netdevy style, so a merge from a cover letter
might look like this:

    Merge branch 'mlx5-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux
    
    Leon Romanovsky says:
    ====================
    This is short series for mlx5 from Meir that adds a DevX UID to the UAR.
    ====================
        
    * mellanox/mlx5-next:
      IB/mlx5: Enable UAR to have DevX UID
      net/mlx5: Add uid field to UAR allocation structures

Where the last three lines are produced by 'git merge --log'

I would suggest a template:

Merge patch series "<cover letter subject>"

David Hildenbrand <david@redhat.com> says:
====================
<over letter body>
====================

* mailing-list:
   [..]

Link: http..
Signed-off-by: ..

As a possible starting point?

> > Linus has been repeatedly against working on random git history
> > points, so I think the unreliable auto-base is not something people
> > should be using.
> 
> I see. But if they do send a base-commit: line from some place random, is that
> okay to accept it?

I would say if that is what the submitter did, then yes, but the
submitter should probably be scolded if the random is too random :)

Jason
