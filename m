Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984B6132
	for <tools@linux.kernel.org>; Thu, 14 Sep 2023 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8Gc1XaSWZdZOIY4FVdYl16DNrBoTruC8xGxukIvFdaY=;
	t=1694674530; x=1695884130; b=m3dokknW3Mvua7rQYYk72f5V/ArJ9u3SkxR6zFwBJRyQ3zw
	o00aSvf/adgVlfENKl4N1Y/y9xyK9LyI3M3WPc2HyrDKKWbxubbkdBRPe8fE24pFBbEN6BN0K26Sz
	CfGLU0p5pJcPpf3xSdKe/i58LMH3KfeuQhCDHl81ANfSslAl9EqOHPMak9kVj05kaWyH6iAbpjxkj
	HTo5MmpXx2uSMcIjU1yKpYsQ7tS80ws6RJDcV6uvMsny+meE+MYNVXfPZzffR7k/Gv1dun+k0dXi6
	FKSjrjLLYoR3reCHrRN7vVdHGGCyYU4Q4GB0VHdOf9krULpQTiUJkXnUaVbwVM1Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qggG6-00GhAe-1X;
	Thu, 14 Sep 2023 08:55:26 +0200
Message-ID: <ff72f308879a12f53fa7ace044ab99ab7dd9e060.camel@sipsolutions.net>
Subject: Re: b4 tag parsing too lax?
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>
Cc: "tools@linux.kernel.org" <tools@linux.kernel.org>, Kalle Valo
	 <kvalo@kernel.org>
Date: Thu, 14 Sep 2023 08:55:25 +0200
In-Reply-To: <202309131601.979D5790@keescook>
References: <202309131243.5D508355@keescook>
	 <20230913-lunchbox-anemia-a19bc1@meerkat> <202309131601.979D5790@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2023-09-13 at 23:04 +0000, Kees Cook wrote:
> On Wed, Sep 13, 2023 at 04:00:27PM -0400, Konstantin Ryabitsev wrote:
> > On Wed, Sep 13, 2023 at 12:44:43PM -0700, Kees Cook wrote:
> > > Hi,
> > >=20
> > > I just saw this in commit ef6e1997da63 ("wifi: mac80211: fortify the
> > > spinlock against deadlock by interrupt"):
> > >=20
> > >   Reviewed-by: tag, or it goes automatically?

Heh, that's kinda funny.

> > While it's possible that b4 did this, it's not any current version.

It didn't.

> Okay, weird! I have no idea how that got there then.
>=20
> I should have CCed Johannes Berg to start with, but now I have. :) I'm
> curious what the workflow for that patch was -- do you use b4? (Perhaps
> this was a b4 behavior accidentally back in May?)
>=20

We use patchwork in wireless to assign the work between Kalle and I. I
guess I could still apply patches using b4 though, but don't, at this
point.

So I guess it's more a bug to report to patchwork, but I'm not sure how
much good that will do unless we fix it ourselves :)

johannes
