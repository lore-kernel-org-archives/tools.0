Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.3057.1588103063253868989
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 12:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UhrVANPP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.196, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f196.google.com with SMTP id 71so18339029qtc.12
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MuLKDUOWu3bVPLopUZl/JV4AIi01ErOzfan66qjAg30=;
        b=UhrVANPPR2TpGBhens0bN2L8ZlYUdgsLwazJYRbE51WolLFb0Ni65GzhFSKcog4mbj
         T+hbPrIKOK7CxRempwkIPYWrPH2zxCEBiGjTblf8Mp1IhTzadTcKekZYHR93Cch0JgDN
         vIbJvbpYjqp/VNKm4O1GcOtF4IoMYZekmzUYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MuLKDUOWu3bVPLopUZl/JV4AIi01ErOzfan66qjAg30=;
        b=qh+qXvfkgz5CbNk7Y2r6p1JhWxA3nuNdYGz7ln59eXmbuwXTPfXK1K3MRE1z5TwVam
         bk4SGG5upEQI7EHVdaPelPW9W7VyCI/+RsxC0EHLnjexpYvYJQsYmmEIQ06RO98oc994
         iSZj1d7Cv387BZ15eE7FLx3jlluCPJEtRystGQ5HeGbrg9dCLDHZVg5/W1ZyUrGsrsdr
         dGkQlgXemCXa8ynvTw+UZ2AWhasGhAnNxSy6wtmxcRwyCl9EHTM/S7ObVAP9aZ1hxVh4
         1PqKlr74I28UPVYqy0sZ1tBWWgyHnsTgfQQL3v4ayKDLtHgvSYK741+carBLzI/NacUK
         wZ6w==
X-Gm-Message-State: AGi0PuY4HdOzI7MT+mCj09WQ5XPhbuQY190tbvrGinfwK+VusBUOI0Xv
	+JEb44HMK+HEV31QldGYhU3jYQ==
X-Google-Smtp-Source: APiQypLMEMHPdSC8SdkRdMBihLq1Xza95bBSle5GwiOyLOKGdY9UE8AxkBlsSfhhcpdGuSMyiAuu8Q==
X-Received: by 2002:ac8:31e1:: with SMTP id i30mr30396015qte.74.1588103062200;
        Tue, 28 Apr 2020 12:44:22 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id u190sm14467338qkb.102.2020.04.28.12.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 12:44:21 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 28 Apr 2020 15:44:19 -0400
Date: Tue, 28 Apr 2020 15:44:19 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200428193550.GX26002@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 28, 2020 at 04:35:50PM -0300, Jason Gunthorpe wrote:
> > - there may be a different number of patches in the series
> > - new revisions will likely be based on newer trees
> > - subjects/commit messages/trailers may be vastly different between two 
> >   series, even if the code is very similar (e.g. someone broke down a 
> >   single large commit into several smaller ones or vice-versa)
> >
> > In my mind, the best way to approach this would be:
> > 
> > 1. Create a single unified diff file from all patches in each series 
> >    (using combinediff)
> > 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> > 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> > 4. Add commit information on top of the diff
> 
> git range-diff is not so bad at visualizing this

Right, but that only works from a tree, correct? Unfortunately, very few 
people are providing base-commit information still, so I'm not sure how 
reliably we could generate a range-diff between series if we don't know 
where in the tree they belong, which is why I was looking at easy ways 
of accomplishing something like this before touching git at all.

If everyone is already using range-diff for this purpose and I'm 
attempting to solve a problem that already has a widely used solution, 
then please also let me know. :)

Thanks,
-K
