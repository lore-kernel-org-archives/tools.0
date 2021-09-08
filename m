Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92372
	for <tools@linux.kernel.org>; Wed,  8 Sep 2021 09:54:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C21461154;
	Wed,  8 Sep 2021 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631094857;
	bh=wo7STA5pehFw+TnslW1b6ND67xLJPAIPzyJX25i9TNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zXZeGN/to8FjIZ3bP26ikcXReRG+7Mo63HoQimmrl7FIgzP9BsS2z/GfQVwB5wVgc
	 jNcRtyjekKtEChjHMt4MQegZibZearVZ1Nhqc784Str36K4FuOaZMlxWa+B0kbu874
	 RlyRyQOEBsAkhAJGRvy9CFQ5704p6nkMvmNXEDa8=
Date: Wed, 8 Sep 2021 11:54:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	saurav.girepunje@hotmail.com, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
Message-ID: <YTiIR0nSnWvUc3nG@kroah.com>
References: <YTcJNrbjTVMXCQUG@kroah.com>
 <22538765-8ad4-6150-200c-a1f4eb0830f0@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22538765-8ad4-6150-200c-a1f4eb0830f0@gmail.com>

On Wed, Sep 08, 2021 at 03:16:53PM +0530, Saurav Girepunje wrote:
> 
> 
> On 07/09/21 12:09 pm, Greg KH wrote:
> > I've run into problems with a specific user that happens to send patches
> > out with a '/' in the message id field.
> > 
> > I think this is a valid thing, but b4 and lore don't seem to handle this
> > very well.
> > 
> > Here's their latest patch:
> > 
> > $ b4 am YTRuXTu/kePBDwAF@user
> > Looking up https://lore.kernel.org/r/YTRuXTu%2FkePBDwAF%40user
> > That message-id is not known.
> > 
> > And yes, if you go to the above link, it is not found.
> > 
> > But, if you go to 'all' it is found:
> > 	https://lore.kernel.org/all/YTRuXTu%2FkePBDwAF@user
> > 
> > Any hints on what to do here?
> > 
> > Note, this is the second time this has happened.  First time I wrongly
> > blamed the developer that they submitted the patch incorrectly, this
> > time they graciously pointed out that they had sent it correctly,
> > something was wrong with my side :)
> > 
> > Saurav, how are you sending these patches out, using 'git send-email' or
> > something else?  What is generating that message id?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Hi Greg,
> 
> I am using mutt to send the patch. Below is muttrc settings.
> 
> unset use_domain        # because joe@localhost is just embarrassing
> 
> 
> set realname = "SAURAV GIREPUNJE"
> 
> 
> set from = "saurav.girepunje@gmail.com"
> 
>                              set use_from = yes
> 
> I am using "mutt -H" command to send the patch and that is creating issue on
> message id.
> See below link:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833192

Great, can you update your version of mutt so that this doesn't happen
any more?  It looks to be fixed in the latest version.

thanks,

greg k-h
