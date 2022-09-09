Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903534C62
	for <tools@linux.kernel.org>; Fri,  9 Sep 2022 16:11:20 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id v15so1576899qvi.11
        for <tools@linux.kernel.org>; Fri, 09 Sep 2022 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=RxIED189E+TUNFi0BBTbVuXu/Z/qKwiR3J4tiz2mh6o=;
        b=Qs7h05l+jh7UO9kA52DzPj2i24w1LDq+PRpKhBDmilQHmiZDaACgm+UNdFMYF2i0AA
         R2o//Z+j0qMNAbMDTdoOhZOUEFT01QsYkiJfeQ80jmWz+3XFaK3uW3UTr3tli0oyPnfI
         OBG0cfwENBxBWgogjv2ceNyWpt3vJBSPHf478=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=RxIED189E+TUNFi0BBTbVuXu/Z/qKwiR3J4tiz2mh6o=;
        b=jZAOMRLyGvHvlo4L+7c6oUze5vBgqgLc6pa6TaNdxtzF55xCG5r3KHhhhCZ+hd3Xw+
         aEtHa0VwyitVy0vTscdmurf1PISWEh8iVRDQW37NMIUr6UGosLw0FXNueUXGdnZykxmX
         HXYkzgViTfqukeIo6wBMWoPtpZXzBz+frKdbU9hbOkvqLl0T0V+WacT2fc9L+rqNpdhd
         fs3jrODISc0X1XPJqYjdrb5LHf8ELczDpT7CFCia1xjX3NCNaXICPlnjZUJBbdOQ6yQj
         ycM6YZo+DgkJpnssS/gUdveQ9Cn8e4VlC4NDcUd4n/9bHXo4J79p26uedDMhNAuAk1+b
         afJw==
X-Gm-Message-State: ACgBeo3pcvk4Fl/of7dgwwAqenNkfBxrWMbfdV5A7VstHk0WrOZxwVq7
	k6ZZeO+hyPu8kALK+Zx1n2m+8iGcvXDBzg==
X-Google-Smtp-Source: AA6agR4Mc1uc6EOwq4gex9T+RtfmisKQ5oqAm2hb/q7UmYgDxFlobfhADoOhi/WiUFjDPPmLmTaeUw==
X-Received: by 2002:a05:6214:21a3:b0:49a:76a8:1c76 with SMTP id t3-20020a05621421a300b0049a76a81c76mr12391362qvc.57.1662739879305;
        Fri, 09 Sep 2022 09:11:19 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a25d300b006b8e8c657ccsm751558qko.117.2022.09.09.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:11:18 -0700 (PDT)
Date: Fri, 9 Sep 2022 12:11:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: Couple of bugs(?) in b4 send
Message-ID: <20220909161117.m3xs23x2cmndyysi@meerkat.local>
References: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>
 <20220908203914.yxgmjm5tsk7jvfoh@meerkat.local>
 <20220908222212.2ofc3atbin2k3fm4@ldmartin-desk2.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908222212.2ofc3atbin2k3fm4@ldmartin-desk2.lan>

On Thu, Sep 08, 2022 at 03:22:12PM -0700, Lucas De Marchi wrote:
> > I'd say this is a feature, as aliases may be defined in any number of ways and
> > I'm not sure we should try to locate all possible places where this may be set.
> > 
> > The idea is that people wouldn't really use it via cli, but via
> > b4.send-series-to and b4.send-series-cc, e.g. for a project like git, you'd
> > define:
> > 
> >    [b4]
> >      send-series-to = git@vger.kernel.org
> > 
> > I'm thinking of automatically including git-topdir/.b4-config when found, so
> > repos using b4 to send/retrieve patches can predefine a bunch of b4 settings
> > relevant to their project.
> 
> Leaving it in the configuration for me is a non-starter. For
> drm subsystem I already have a few mailing lists that I may want in the
> To header depending on what I'm touching.  Having to create a separate
> worktree for the rare moments I send a patch to nouveau for example
> doesn't seem like a good solution
>
> send-series-to in the configuration may work well for projects that
> have a single mailing list, but that is not the Linux kernel.

Oh, indeed, I was not intending this for kernel repos, just for projects that
only have a single list where to send everything (git, dev tools, etc). I was
just explaining the reason for its existence.

> I wonder if we could have a configuration to import headers from
> git-format-patch, so even things like format.add-header would just work.
> Then Cc/To would already be resolved by git itself.

I'm not sure it's a good goal to replace git-format-patch and git-send-email
with this work -- the target is really the folks who look at the man-page for
those two commands, get super confused, and ask why they can't just submit a
pull request.

For many, running "b4 prep --format-patch" followed by git-send-email may be
the better approach.

> > How about:
> > 
> >    --no-auto-cc  : skips adding addresses found in trailers
> >    --no-tocc-cmd : skips executing tocmd/cccmd (get_maintainer.pl, if found)
> 
> lgtm

Another thought I had is to add:

    b4 trailers --auto-cc

This would populate the Cc: trailers from what is output by tocmd and cccmd
(excluding any addresses already present in trailers), plus anything found in
format.to and format.cc.

I haven't done this before because I was worried that the list would be too
huge on some of the commits, but the upside is that the submitter can then
clean them up and get the Cc list looking exactly as they want it on a
per-commit basis.

-K
