Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2C3FE0;
	Thu,  9 Sep 2021 13:43:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 349EA580576;
	Thu,  9 Sep 2021 09:43:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 Sep 2021 09:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=eYI7imRfvrkUANofFVQZ1pOWdg8
	N3Qh8cMxBldQA3ic=; b=LiIvq26K+zoBQDIYB3KdL3h9tmLvb9fAICef1gDP0mO
	ICRoQR3aDaPnu/85LAlTr5Mg7DZaRqoK1sejocH86cNOXzxG97izy4DtalRfGAZL
	kbtRT51gRAp31DhKDfh7jipyuUsdhKNqcWF5dvzx9IgzpvCQ2BL+xYxESO0h+ApD
	R1PvomBvV+IJmG08Acbg/dWjSfWg1jqdL2CZKscfnSsBIZmJa6XZXchE8+9Nud/j
	3sYAzuYD5Y3+jTKVJg/90ly8v94im/5YhlSzgAyGMT9E+lZZpewQ15Ls3wbJerbA
	QZOU+UvODI1SnDqF/KPJbZQFli3/CWJuMXkprI+Oc/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eYI7im
	RfvrkUANofFVQZ1pOWdg8N3Qh8cMxBldQA3ic=; b=r7Q9/7oHgB184Wt11u1Ob6
	Bjkbz/Z6e7/zQwrTNPHkGfOZmZ1b3zJ/vCWxGvlUpiPIfK69wAaB9IeZeg1SnX6D
	gY9HIL/A7LDCxpAvYnWYeddT1sfA3Ead6XI8hAjvU+7UAyqqGv3j7CeDB3+0idVN
	cQa1ZHCp7mqjGpa+eM9uCj//gT351o+oZvZHJE2x/gBWbzj1zLunJk9j270mGRgY
	f9LDOzdTwB6PxdWFlxKHYWOafSOgY+LLhSER7E4a/liftUXh203k0EpFbpQ6feYS
	7aFdZl8yI/9plfdyqZFQ+ejy7DQG1v42/CNyjT44VCw42ViGyae+a/vIRMXlyWTw
	==
X-ME-Sender: <xms:fA86YdpgjYgjcw0YJQJ3C0WFYScAkIRzzDFkRyMAYF847RJXdFTuyQ>
    <xme:fA86Yfo0JMazCt3QKVAFbGOt_eb6eYDQwWlkzwBiqtcJkcINfp_kx-vRslD7xEsVX
    vodYjUL00bMIg>
X-ME-Received: <xmr:fA86YaOC2349jTbnBJ4-lUj8vnrWELIxd3Fr_6I_pvlRDNs2x9iifwPfjugf4S30ji4cKZDIhgOL9Eo62x5t1MBganFT24C9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefhfffghf
    duvdelgfevfffgfeeugeeutdetteeuveelffffgfegieetueeufeegteenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgpdhinhgsohigrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:fA86YY59_EeJvJzmNBsTCHpocXd_VWGAyNGbWeyzaUzryiZZRbwtAw>
    <xmx:fA86Yc7Nep5rMhH8DK5X5hNHlQwtfv5V-ayBrzXEZHsIbfscaBPPyA>
    <xmx:fA86YQhR_63VRWXrGYNZ9v7SUgPzTeb0LSgrh3eJbJEPI1oAK-PkFg>
    <xmx:fQ86YcyZmPWFlU32wnqxyFwJUjoxmVyCV-b9r239SY00kirHVhtkjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 09:43:24 -0400 (EDT)
Date: Thu, 9 Sep 2021 15:43:21 +0200
From: Greg KH <greg@kroah.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToPeUhL+Ro3zlnq@kroah.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToM6bH/I9rHQMeE@google.com>

On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> On Thu, 09 Sep 2021, Steven Rostedt wrote:
> > On Wed, 8 Sep 2021 14:37:46 -0400
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > 
> > > > Can we represent LKML on Patchwork as a reasonable alternative?  
> > > 
> > > No. That said, what I'm currently working on is a way to provide query-defined
> > > public-inbox sources. If you can define what kind of patches you are
> > > interested in as a lore.kernel.org query, we can save that search and feed
> > > *that* into patchwork. So, instead of feeding all of LKML into patchwork just
> > > for the few patches you're interested in, we can just feed the subset of
> > > patches that you actually want.
> > 
> > This is basically what I have done locally. I set up a local instance of
> > patchwork. Added a procmail filter to copy all my emails with "PATCH" in the
> > subject into its own folder. Then I have a cron job that runs the following
> > script to add "List-ID: <rostedt.inbox.com>" to these emails, as my local
> > patchwork "listens" to the "mailing list" called "rostedt.inbox.com". And
> > then send them off to my local patchwork instance.
> > 
> > #!/usr/bin/perl -w
> > 
> > my $state = "none";
> > my $patch = 0;
> > 
> > while (<>) {
> >         if (/^From /) {
> >                 $state = "head";
> >                 $patch = 0;
> >         } elsif ($state eq "head") {
> >                 if (/^\s*$/) {
> >                         print "List-ID: <rostedt.inbox.com>\n" if ($patch);
> >                         $state = "body";
> >                 } else {
> >                         if (/list-id/i) {
> >                                 next;
> >                         } elsif (/^Subject.*patch/i) {
> >                                 $patch = 1;
> >                         }
> >                 }
> >         }
> >         print;
> > }
> > 
> > 
> > This works great for me, but I can imagine if people have their own public
> > inboxes, where we can just create a patchwork instance that feeds off of
> > these inboxes, I believe you will get the same functionality that I have.
> > 
> > Note, I also have filters to read patches that have "[for-next]" and
> > "[for-linus]" which converts the patches in patchwork from "New" to "Under
> > Review". Then I have a subscription to all commits that go into Linus's
> > tree, and I process all of them to go through and "Approve" any patch that
> > it finds.
> > 
> > I still would love a way to download patchwork offline, where it loads
> > locally all pending patches, and lets you review / apply them locally
> > without needing to be connected online, as this would be useful during
> > flights. Then when you land, you can upload your changes.
> 
> Well, as beautifully inefficient as that all sounds, it might be
> slightly less time consuming if I just succumb to peer pressure and
> switch pwclient out for b4.
> 
> Thankfully, my use-case is much simpler than Steven's.
> 
> In my current implementation, I have pwclient pull down the patch,
> apply my SoB and apply the it, all in one foul swoop:
> 
>   pwclient git-am -p ${project} -3 -s ${pwid}
> 
> Does b4 provide this functionality too, or do I have to script around
> it?  How have other's chosen to automatically apply the downloaded
> mboxes?

I do it from my mail client by piping the message to this:
	b4 am -t -o - | git am -s

which will download the whole series of patches, and acks and
reviewed-by and apply them, and then apply them with git.

I'm sure your email client can do much the same thing.

thanks,

greg k-h
