Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5372
	for <tools@linux.kernel.org>; Tue,  7 Sep 2021 14:36:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D55626109F;
	Tue,  7 Sep 2021 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631025419;
	bh=2obcPG6IpA31PfjTcEklKSaBm/COovHw1hA9/gQsVRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0hFjsUhQPdeLvIlv9XpvoHJi0XoW9dbkr81FehO6EBqirZzrIlDrjwlIhn+MFla1i
	 vY6rmQEwDB6weg7Va7Qv3JfVI+uB4LEsIkfMQ6JJydAZzzfpx2Pn8/a7HAFz7dCW7n
	 7ksTRN3pusrTlroL7WknnayRHQQaB3yTkbfsY2kI=
Date: Tue, 7 Sep 2021 16:36:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
Message-ID: <YTd5CNUm1EhUyV3u@kroah.com>
References: <YTcJNrbjTVMXCQUG@kroah.com>
 <20210907143107.dlygwnyl3v5w345m@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907143107.dlygwnyl3v5w345m@meerkat.local>

On Tue, Sep 07, 2021 at 10:31:07AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 07, 2021 at 08:39:50AM +0200, Greg KH wrote:
> > I've run into problems with a specific user that happens to send patches
> > out with a '/' in the message id field.
> 
> There's some interesting interaction between nginx, varnish, and public-inbox
> that results in this behaviour. There is a way to solve it, but I don't like
> the approach, so I'm going to work with upstream to see what my options are.

Thanks for looking into it!

greg k-h
