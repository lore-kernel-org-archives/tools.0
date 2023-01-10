Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0DC5257
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 00:02:13 +0000 (UTC)
Date: Tue, 10 Jan 2023 00:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
	t=1673308925; bh=8po+JU2dsqLhVWq1GzAMfPREoFRjjhVp/poptyXMIP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+6sypSPxRen0Ze8nNgmFtybSPN9kkhgP026qiTWQV6Xz8LmsFnnRJMSQfNUhHNu4
	 3KdzN5Hr8WmywYqQkDAoLGghT7+NmZooSByfBdk42qqc8KF6Y8vTn/IsaAe/gc+h99
	 rtRrM9TCEl60AAfFh5MTMfPtZOi9pdGOkfcsOe7g=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [BUG b4] misformatted email recipients
Message-ID: <20230110000203.tx6nnflk6ufl5szr@t-8ch.de>
References: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>
 <20230109231855.wk3eepum7wiubawj@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109231855.wk3eepum7wiubawj@meerkat.local>

On Mon, Jan 09, 2023 at 06:18:55PM -0500, Konstantin Ryabitsev wrote:
> On Mon, Jan 09, 2023 at 02:15:16PM +0000, Thomas Weißschuh wrote:
> > it seems in certain cases b4 will misfold/misformat email recipient.
> > The exact conditions are that a long address line pushes the comma
> > separating different addresses to a new line during folding and that
> > line contains unicode data that is encoded.
> > In this case the comma is also encoded.
> > 
> > The root cause is a bug in Python email module [0].
> > 
> > Such misformatted mails are rejected by some mail servers, for example
> > infradead.org.
> > Also it seems they are not indexed by public-inbox [1].
> > 
> > I hit this case in the wild [2].
> 
> If you're feeling adventurous, the master branch has one big workaround the
> problem (basically, we use our own routines to dump the msg to bytes -- not
> too crazy, considering we're always working with non-mime plaintext structure
> with minimal headers).

This seems to have worked for my specific example: 
https://lore.kernel.org/lkml/20221212-keys-blacklist-v6-0-933267a80582@weissschuh.net/

Thanks for the quick fix!
Thomas
