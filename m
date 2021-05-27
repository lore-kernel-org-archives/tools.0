Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05C92FB4;
	Thu, 27 May 2021 10:20:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 941FC60FEB;
	Thu, 27 May 2021 10:20:00 +0000 (UTC)
Date: Thu, 27 May 2021 12:19:58 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <YK9yTmBvxymXCzOa@kroah.com>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526192558.pex7tuorwqvkzxe3@nitro.local>

On Wed, May 26, 2021 at 03:25:58PM -0400, Konstantin Ryabitsev wrote:
> ## Patch attestation
> 
> This version includes what I hope is the final rewrite of patch attestation
> features, which has largely moved into its own tool and library called
> "patatt": 
> 
>     https://pypi.org/project/patatt/
> 
> Patatt allows for end-to-end cryptographic attestation of patches via a
> separate X-Developer-Signature email header that is very similar to DKIM. If
> you have an hour, you can see my presentation to OpenSSF Digital Attestation
> WG here:
> https://www.youtube.com/watch?v=no6r1iUqY1A
> 
> B4 will check for this header in the messages it retrieves and will invoke
> patatt (if found) to perform the attestation check, e.g.:
> 
>     $ b4 am -o/tmp 20210521184811.617875-1-konstantin@linuxfoundation.org
>     [...]
>     Checking attestation on all messages, may take a moment...
>     ---
>       ✓ [PATCH 1/3] Sign Message-Id header if present
>       ✓ [PATCH 2/3] Make header order deterministic
>       ✓ [PATCH 3/3] Release as 0.4.0
>       ---
>       ✓ Signed: openpgp/konstantin@linuxfoundation.org
>       ✓ Signed: DKIM/linuxfoundation.org
>     ---
>     [...]
> 
> It is very easy to start signing patches with patatt, so I invite everyone to
> test it out. If you are using git-send-email, you can automate the whole thing
> to happen behind the scenes via the sendemail-validate hook:
> https://pypi.org/project/patatt/#getting-started-as-contributor

Hey, it "just works!":

	Looking up https://lore.kernel.org/r/20210527101426.3283214-1-gregkh%40linuxfoundation.org
	Grabbing thread from lore.kernel.org/linux-usb/20210527101426.3283214-1-gregkh%40linuxfoundation.org/t.mbox.gz
	Analyzing 1 messages in the thread
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH] USB: gr_udc: remove dentry storage for debugfs file
	  ---
	  ✓ Signed: openpgp/gregkh@linuxfoundation.org
	  ✓ Signed: DKIM/linuxfoundation.org
	---
	Total patches: 1
	---
	 Link: https://lore.kernel.org/r/20210527101426.3283214-1-gregkh@linuxfoundation.org
	 Base: not found (applies clean to current tree)
	Applying: USB: gr_udc: remove dentry storage for debugfs file


Nice job!

greg k-h
