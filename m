Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC373FF0;
	Thu,  9 Sep 2021 15:20:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7F0D2D3BCD;
	Thu,  9 Sep 2021 14:51:25 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2454F6001C;
	Thu,  9 Sep 2021 14:51:16 +0000 (UTC)
Date: Thu, 9 Sep 2021 16:51:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YTofYpb5U1cn66M9@piout.net>
References: <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
 <YToQEQPcjU5RUww7@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToQEQPcjU5RUww7@google.com>

On 09/09/2021 14:45:53+0100, Lee Jones wrote:
> On Thu, 09 Sep 2021, Konstantin Ryabitsev wrote:
> 
> > On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> > > In my current implementation, I have pwclient pull down the patch,
> > > apply my SoB and apply the it, all in one foul swoop:
> > > 
> > >   pwclient git-am -p ${project} -3 -s ${pwid}
> > > 
> > > Does b4 provide this functionality too, or do I have to script around
> > > it?  How have other's chosen to automatically apply the downloaded
> > > mboxes?
> > 
> > b4 am -3 -s -o- msgid | git am
> 
> Ah yes, piping to stdout and straight into Git works great.
> 
> And with "-P _", it does exactly what I want.
> 

I did use the stdout piping to git am until I have seen someone on a
mailing list adding this to .gitconfig

[alias]
	b4am = "!sh -c 'b4 am -ctsl -o- $1 | git am' -"
	b4am1 = "!sh -c 'b4 am -ctsl -o- -P_ $1 | git am' -"

and then you can directly do git b4am <msg-id>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
