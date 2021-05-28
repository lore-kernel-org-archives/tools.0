Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875636D14
	for <tools@linux.kernel.org>; Fri, 28 May 2021 21:09:52 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id h24so3684159qtm.12
        for <tools@linux.kernel.org>; Fri, 28 May 2021 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FjKJF5tACXJViANKGSA5makfbUOugxHaElcz4+R1lNQ=;
        b=fFc0r7Pa/gPR2jTM01Wa6+TV2+m+pLJEw8wi4fD6hH+MGoY9M/orlTITDvaOfHdwEE
         15ReAzhEk0/Y+YLGheUhbU8QLtwIDq3RsionNQOekYf/CQIvPOvyHH2u/qBQ/8xsAV7q
         2A7J94Tj8Yn8dSBX2XuOOpMjslrAjBPnLUTrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FjKJF5tACXJViANKGSA5makfbUOugxHaElcz4+R1lNQ=;
        b=O9FkNNWMRROlbQLQZE3SYAwwzSA3zB6YjnluN1cpXd/5Fr55tc8raWj+3DfRMv4gWU
         Ck2WgLQt+vjsNkGXxczutnuvSEn7FqEPeo9kvcOn4wlS2MnyyyXjdgdfmm7W23WKj8fH
         ZqlwrdgSn+MFFontzZ1xdUJLJJSb+fLqd2CLmiezlYAa/1lkqsQNN7qiW7qLbWt9IyCI
         OX+vLoGkFKrqJngyc8c87CSCUoNO7CnG611rHUz3sDlszxifgHP+vASWClZRHXBhMTbW
         zZxHBIN2LFT2uHaqjobygqIdOJeZ5tsXRM7CmwnSnb2wQWwT6uQLpALCueajxRZLCOtF
         O/Og==
X-Gm-Message-State: AOAM533CHisSADQ6vWGzGabMBmAGjaCTIhBRQmvkM30vEstG5Xnsy7oc
	Q3Mx/CHEOJasdIVxRlyrsSYFZQ==
X-Google-Smtp-Source: ABdhPJzqeNQeACN0MBb+ux8+F9JlhUE0znn0Jq/qeE/xQjwEpO+M7+FB+cSldli+PyBFBZjF+cnQDg==
X-Received: by 2002:ac8:5c8d:: with SMTP id r13mr5330276qta.69.1622236191408;
        Fri, 28 May 2021 14:09:51 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y13sm4089412qkj.84.2021.05.28.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 14:09:51 -0700 (PDT)
Date: Fri, 28 May 2021 17:09:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: grokmirror and pi-piper for all emails on a list
Message-ID: <20210528210949.xum3ya7fsucofenp@nitro.local>
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local>
 <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
 <20210528195320.c2vbhfg3zj365ebw@nitro.local>
 <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>

On Fri, May 28, 2021 at 01:34:03PM -0700, Luis Chamberlain wrote:
> And, indeed I see it now chugging on procmail doing all the emails.
> Indeed, I can see this is going to take a while. If only mail
> processing was parallelized :) Thanks for all this!
> 
> > > > Also of note is that the upcoming "lei" tool from public-inbox is going to be
> > > > a much more robust approach to doing what pi-piper does. I really wrote it
> > > > mostly so we could feed lore lists into patchwork. :)
> > >
> > > Whoa, ok so, before I go on raving about this, I should wait instead
> > > and rave about lei later?
> >
> > You can use lei right now if you like -- I believe it is fairly stable.
> 
> Where do I find such a treasure?

For the moment, mostly by cloning https://public-inbox.org/public-inbox.git
and then reading Documentation/lei-*

The best place to ask follow-up questions would be on meta@public-inbox.org.

Best,
-K
