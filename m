Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E933E9
	for <tools@linux.kernel.org>; Fri, 24 Jun 2022 16:06:31 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id r138so2142853qke.13
        for <tools@linux.kernel.org>; Fri, 24 Jun 2022 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JSPtmXe2ov5k5QHJwkfLB4QF39hPSj7SpKSiunRU5Zk=;
        b=nmCrwJb8iEeNB5+P744jdvUkLe1Vzj/i121jKZCzHEpL6lhzEnQLw2Z6V4AtxFgtiQ
         B/9XJVi0QfEXVOe//70VnNHldYwQaQIYSHQfi6mSQkOmbZi2It619orlY92sTCqm/rb1
         WtPLuU7fNnODh9cQ2FYzDoXlxCNaYNFnaydB2Y4+w32QtlJ5EjWzzQ2GcbOe5990zEMO
         hEHEaL8eJQ8tZpb5UnPS1POhG0N7i3GNPbz42ZO0mYCI5gGLvV7/EiAAZZuK3k1lctHk
         vmn3BY/SKbDTZk34mIALxNEMneyi2yc/IoTe1094QU+WMivh8kP4CVxdR7dFILnfesXr
         rsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JSPtmXe2ov5k5QHJwkfLB4QF39hPSj7SpKSiunRU5Zk=;
        b=XBShlE8E+DXgVIo/2g02ypQeNxDe73rdi+8gdHqUVP+I4ypgiG1TmESLFV6r3jVrF9
         jd3FFgk+GcCyTHNHUeD3V64+mXSlk+SaUTSZk5a4wlE67wEkKQZaUxBSfRyM/g97bfGh
         O74kuOEXvQVxphm7aPpFBKh4IElzNxYoPkyzYwCAEd1Me/Z1+chf4ResSt03EXiuBw3i
         W8ujFljjIVwbhe95mgGc7XS5LvCToKHs7r8NeB+CN0jG+0c7wdoWDdreeD3WrKfPpZFN
         5YDlXRtaGMI5pRYxeoG13PefyKJ821BhRZk4Knii7ql5mcPJXL4hmZ5RLjDUH9wksuLN
         LtKA==
X-Gm-Message-State: AJIora+KU8IQOtV9ey30amgAY54f0jhKYSdWbGRusEHOdrdOFjQ48JJR
	rRZ7lWHNxyPODHv9UQwHQ7krmA==
X-Google-Smtp-Source: AGRyM1toW3+0wUaAcRAOwcSG4WnS446GujB7VRS0ae1+A3BCQRktvGXRZSxXRnmbqi/9RO9Y11uwKg==
X-Received: by 2002:a05:620a:40d3:b0:6a6:e11d:77be with SMTP id g19-20020a05620a40d300b006a6e11d77bemr10982641qko.633.1656086789675;
        Fri, 24 Jun 2022 09:06:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id v22-20020ac87496000000b003051f450049sm1655709qtq.8.2022.06.24.09.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:06:29 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1o4lpE-000Zxq-Dd; Fri, 24 Jun 2022 13:06:28 -0300
Date: Fri, 24 Jun 2022 13:06:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220624160628.GB23621@ziepe.ca>
References: <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
 <20220624155213.4wfbnttowgom2sjz@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624155213.4wfbnttowgom2sjz@meerkat.local>

On Fri, Jun 24, 2022 at 11:52:13AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 24, 2022 at 11:29:44AM -0400, Theodore Ts'o wrote:
> > It would be great if we had some kind of tooling where when someone
> > sends a new version of the patch series, the tooling opened an editor
> > and allowed the submitted to enter a quick changelog of what changed
> > between the v25 and v26 version of the patch, with an option to also
> > edit the body of the cover letter.  And then then when the patch is
> > sent via e-mail, all of this would be appended to the cummulative
> > version of the cover letter.
> 
> This feature is in-flight for "b4 submit". I wrote about it here:
> https://lore.kernel.org/git/20211217183942.npvkb3ajnx6p5cbp@meerkat.local/
> 
> Here's the relevant part, slightly updated with the latest info:
> 
> 1. b4 submit --new: this will create a new tracking branch and define
>    some metadata to go with it, such as a cover letter template. The cover
>    letter can be edited using `b4 submit --edit-cover` at any time.

It would be nice if this could store the cover letter in an empty git
commit at the top of the branch.

At least here we always require cover letters to be reviewed (eg in
gerrit/gitlab/whatever) along with patches and having them stored as
notes or in the branch description that is not git pushable is not so
useful.

> 2. b4 submit --send: will generate a patch series from any commits created
>    from the topical branch fork point and use the cover letter from the
>    previous step. It will be able to send the patches using the traditional
>    SMTP way, OR it will allow using a web-based submission service that will
>    eventually be set up at kernel.org:

In my tooling I build a git commit that contains the raw final emails
sent, the message-id's that were used, a link to lore, and the git
commit range that bounds what was sent, then log this commit as an
dated archival branch so I can have a good idea of where everything is
and recover back to the exact git commits sent if I need to. Sort of
an enhanced 'reflog'.

I find it is really important be able to go back to the lore link of
the historical version(s) easially.

> 4. b4 submit --sync: will retrieve any received code review trailers
>    (reviewed-by, acked-by, etc) and amend the corresponding commits in the
>    topical branch, assuming we can match patch-id's (I've not tackled this
>    yet, so I may be unduly optimistic here).

Yay, I hope this is generally usable :)
 
> 5. b4 submit --reroll: will prepare a v2 (v3, v4) of the series, reusing the
>    same change-id trailer and adding a templated "Changes in v2" entry to the
>    cover letter (that must be edited before --send works again).

With an automatic lore url to the prior version?

Jason
