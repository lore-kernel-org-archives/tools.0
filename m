Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2A72
	for <tools@linux.kernel.org>; Tue,  7 Sep 2021 06:39:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C37D60232;
	Tue,  7 Sep 2021 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630996793;
	bh=4iL1mAd4qwXhnEsQiqR5e5838fjAthrlYmPdoSqsqgw=;
	h=Date:From:To:Cc:Subject:From;
	b=defZ1NDqX2uXOrQujgoF6iOcpCFdKIldoiCOPaax4RZU6DDMvBd/osTOq0YhemDp4
	 G8GJSDTvwFmcBupbisaBiEkAhr5MHNWvinZ08y/wWo2HrraOVBbwnOjHiHZBIhBVZd
	 EzCmQ22Wxo1wiQr5ZyLB3rgD6S4lcIT13AHLM25M=
Date: Tue, 7 Sep 2021 08:39:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, tools@linux.kernel.org
Subject: b4 and lore and '/' in a message id
Message-ID: <YTcJNrbjTVMXCQUG@kroah.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've run into problems with a specific user that happens to send patches
out with a '/' in the message id field.

I think this is a valid thing, but b4 and lore don't seem to handle this
very well.

Here's their latest patch:

$ b4 am YTRuXTu/kePBDwAF@user
Looking up https://lore.kernel.org/r/YTRuXTu%2FkePBDwAF%40user
That message-id is not known.

And yes, if you go to the above link, it is not found.

But, if you go to 'all' it is found:
	https://lore.kernel.org/all/YTRuXTu%2FkePBDwAF@user

Any hints on what to do here?

Note, this is the second time this has happened.  First time I wrongly
blamed the developer that they submitted the patch incorrectly, this
time they graciously pointed out that they had sent it correctly,
something was wrong with my side :)

Saurav, how are you sending these patches out, using 'git send-email' or
something else?  What is generating that message id?

thanks,

greg k-h
