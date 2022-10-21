Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3076130
	for <tools@linux.kernel.org>; Fri, 21 Oct 2022 19:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB900C433D6;
	Fri, 21 Oct 2022 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666382248;
	bh=XcpRwMnBCCxdHVeLluw9Obdjf37TEcgeUyJawMV0J/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qm2qML5k3aC/bhsfFZSzpSqQavMOI76mO42DbGnO/EbeIqQRbGJJZ9qa2yKjDE/13
	 xHuFW9c9buu7CWgq5nnqxcwdiOJnLsQxETfpl9t2aAbET06n2E9EkEy35df28O/I60
	 3zgiXXtHfFmMQohiqhjOaF8YHgzG9j/SSBL5hGuD0e30U4Dd8SRNZN9gaHcLmac0dg
	 dhTXxa6KFh6+yU9uhGILaJKsMj4XWFM2A+vY5lvd4jbKFZvUZ8skykewY0R79daTqP
	 LRZ/kGi21f/SYneMCqZoaYc5efnTIDSPbe8OTWy45sLnFoc1iIDHH5fL+7Vtt7nwL0
	 hCYZdUblVmLQQ==
Date: Fri, 21 Oct 2022 14:57:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	tools@linux.kernel.org
Subject: Re: b4 send --output-dir eml's sent with git send-email creates two
 From: in the mail body
Message-ID: <20221021195727.GA303980@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019193208.euw2lv2d2anpzvdf@meerkat.local>

On Wed, Oct 19, 2022 at 03:32:08PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Oct 19, 2022 at 06:23:09PM +0200, Quentin Schulz wrote:
> ...

> That said...
> 
> > The eml file created by b4 send --output-dir has the From: field using the
> > current git identity which I assume is the issue.
> 
> Right, we're not doing quite the right thing here either, because when there's
> a sendemail.from set up, we should be using that instead of the user.name +
> user.email. I'll see how we can fix this up to do the right thing.

I think I'm seeing a similar issue.  I have:

  [user]
        name = Bjorn Helgaas
        email = bhelgaas@google.com

  [sendemail]
        from = Bjorn Helgaas <helgaas@kernel.org>

and when I send patches with "git send-email", it works fine, e.g.,
  https://lore.kernel.org/all/20221014001911.3342485-1-helgaas@kernel.org/

But if I send patches with "b4 send" (0.10.1), the email is sent with
"From: Bjorn Helgaas <bhelgaas@google.com>", e.g.,
  https://lore.kernel.org/all/20221021-wip-bjorn-22-10-slow-down-io-alpha-v2-0-4f89a85f1b61@google.com/
which seems to make it to the vger lists, but I get DMARC bounces for
other folks.

Bjorn
