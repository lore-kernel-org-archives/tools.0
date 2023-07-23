Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF32627;
	Sun, 23 Jul 2023 01:45:19 +0000 (UTC)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id 7D11C1F545;
	Sun, 23 Jul 2023 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1690076184;
	bh=SqQ5W5RIwnSsxnJQUsMRGg3prfrb4CyMNqKsrhqqMM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC7oLxnKR+99Fsr1JyWjjrvNAEeS1CWivEf4Zat4D73LO33q0rJT/jJ5Z4Y/qRLnv
	 TUwtCnpyns90IC3tqfyT12yT6Z4R8plpCwAxjCcd1cAOpMKQCr/TcANtwxg07KZ5iU
	 Lcyexi6vsoQ7VOUAcDZkBBpRpWNptojowL2ZoH5o=
Date: Sun, 23 Jul 2023 01:36:24 +0000
From: Eric Wong <e@80x24.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Fetching an mbox from lore
Message-ID: <20230723013624.M167248@dcvr>
References: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>

Maxime Ripard <mripard@redhat.com> wrote:
> LORE_URL = "https://lore.kernel.org/linux-clk"

That should be:

  LORE_URL = "https://lore.kernel.org/linux-clk/"

The trailing slash is critical.  The URL format of public-inbox
enforces it to ensure mirroring via `wget --recursive' works.

> Trying to connect to https://lore.kernel.org/linux-clk?q=d%3A1.week.ago..&x=m
> Redirecting to http://lore.kernel.org/linux-clk/?q=d%3A1.week.ago..&x=m
> Trying to connect to http://lore.kernel.org/linux-clk/?q=d%3A1.week.ago..&x=m
> Redirecting to https://lore.kernel.org/linux-clk/?q=d%3A1.week.ago..&x=m

I'm not sure why lore goes HTTPS => HTTP, though...

lore probably needs to have Plack::Middleware::ReverseProxy
installed and configure the reverse proxy (likely nginx) to set
X-Forwarded-HTTPS:1 or X-Forwarded-Proto:https headers

> If I do allow redirects, then requests will issue a GET on the new
> location and I'll end up with the HTML webpage of that request.
> 
> Am I trying to do something not supported here, or is it supposed to
> work and my script is wrong for some reason?

I can't remember off the top of my head how redirect rules ought
to work for non-GET requests, but avoiding redirects is usually
prudent
