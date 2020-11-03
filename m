Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.5153.1604442659970887589
 for <tools@linux.kernel.org>;
 Tue, 03 Nov 2020 14:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hRotF+F3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.66, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f66.google.com with SMTP id 63so8803235qva.7
        for <tools@linux.kernel.org>; Tue, 03 Nov 2020 14:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rOJIIh0++SLxvRYyEtHIWZSRFNMd6d1jwdvks4R9S6A=;
        b=hRotF+F3k6BNCTgCbGpfUVYLf7S/RCYfb/jVCJnLGVmgR8iQsM9Q59FusBvqP1scaU
         t9TEh+eY7XjRMMIy65e3FdM10k3gJdFRRWsr2dDEzxbf0AFgNTf/j9dG+Iq87vUdXAzX
         U7JbR8Wq2SQWxnI6SMeRpz6n9EqdYo/T3sWbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rOJIIh0++SLxvRYyEtHIWZSRFNMd6d1jwdvks4R9S6A=;
        b=f8H370yu04LgZx9ngpBkOhWn7innaoF23AVIogXZx+mZ5CZ4A9f2vxZEAqzt/pnkpF
         iFHYaEX5SeVEZDkbcYsusKZrYHquswsfzGiTrlXEBM8WeYaUM5e/Wa2Sh7mgGH4M9h6s
         uk0CYHyST38MdJ4Xr8rmWNd3xXxQCmbHI94WJiExZ1Fk9fdnyhbVYI7hxF2f7ThB0B9S
         x5wPEHA0YXb3tmzyy6BMaGZWknrBKl8LDjRr0pQEoSe19uvqFDs9wgcU8aIgM3l8xN28
         VPeQYfPl5S115TunjeJiIku5fcuZSQ2lx1H4XYEe2IqKcn2nghcoq5zXJTXQcSX5n1Ry
         O4AQ==
X-Gm-Message-State: AOAM5307HEGZSjkCLIwQyJxmtw9XzoujUim2QG8T6RSSLHIdHAZkI12E
	swkWOBtYQWlGd5dn50z4vFJFVg==
X-Google-Smtp-Source: ABdhPJy43/hERqajLIgpBf0XpK7NWYXOvGkQM2IjHss4jnXyk3YrmLvUjFMoh9mnG67HQgodj+S+fQ==
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr28887721qvx.60.1604442659034;
        Tue, 03 Nov 2020 14:30:59 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id b196sm162141qkg.124.2020.11.03.14.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 14:30:58 -0800 (PST)
Date: Tue, 3 Nov 2020 17:30:56 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Marc Zyngier <maz@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [b4][PATCH] Fix handling of series with the [PATCHvX] defect
Message-ID: <20201103223056.3y4v4n4pkm4gr7xu@chatter.i7.local>
References: <20201030105153.3015432-1-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201030105153.3015432-1-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 30, 2020 at 10:51:53AM +0000, Marc Zyngier wrote:
> b4 tries to handle subject lines such as "[PATCHvX]" by replacing
> the subject line in situ, but seems to do a rather bad job of it,
> resulting in only the first patch of the series being picked up.
> Fetching <20201026134931.28246-1-mark.rutland@arm.com> does exhibit
> the problem.
> 
> Fixing the re.sub() expression allows normal funtionalities to be
> restored, and the above series to be fetched.

Thanks, I have no idea how that bad regex made it in. Applied both to 
master and stable-0.5.y.

-K
