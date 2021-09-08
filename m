Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D172
	for <tools@linux.kernel.org>; Wed,  8 Sep 2021 13:49:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B1146108D;
	Wed,  8 Sep 2021 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631108959;
	bh=hZwNV6kHSFeSPGy1hILc5i/FzJpGt5z/iuo9y9ewTyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibwiKQYqMxkZUZj/40dRkuM42KEHUH1oLz76CEvZ+6hAKko1LMYj5XrUmuYwLOpLR
	 qappHcXWZI+28jT4eij7ntQQ0NQYaiBt+mo5v4HKtVlwLlrVMIQbK5slcdlGpU6bEA
	 tIffL1gyIkq4Mw2TR7ELBk+xj0TGrrBhMQJW9HCA=
Date: Wed, 8 Sep 2021 15:49:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
Message-ID: <YTi/XYzSLo3gNne9@kroah.com>
References: <YTcJNrbjTVMXCQUG@kroah.com>
 <20210908131158.it5lhuxyc7arw4uv@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210908131158.it5lhuxyc7arw4uv@meerkat.local>

On Wed, Sep 08, 2021 at 09:11:58AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 07, 2021 at 08:39:50AM +0200, Greg KH wrote:
> > I've run into problems with a specific user that happens to send patches
> > out with a '/' in the message id field.
> > 
> > I think this is a valid thing, but b4 and lore don't seem to handle this
> > very well.
> 
> The latest public-inbox version allows us to do the right thing here, so
> things work as expected now:
> 
> 	$ b4 am YTRuXTu/kePBDwAF@user
> 	Looking up https://lore.kernel.org/r/YTRuXTu%2FkePBDwAF%40user
> 	Analyzing 5 messages in the thread
> 	Checking attestation on all messages, may take a moment...
> 	---
> 	  ✓ [PATCH] staging: r8188eu: include: remove duplicate declaration.
> 	  ---
> 	  ✓ Signed: DKIM/gmail.com
> 	---
> 	Total patches: 1
> 	---
> 	 Link: https://lore.kernel.org/r/YTRuXTu/kePBDwAF@user
> 	 Base: applies clean to current tree
> 		   git am ./20210905_saurav_girepunje_staging_r8188eu_include_remove_duplicate_declaration.mbx
> 
> Best regards,
> -K

Wonderful, thank you!

greg k-h
