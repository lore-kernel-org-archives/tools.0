Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E572
	for <tools@linux.kernel.org>; Mon, 20 Sep 2021 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=Content-Disposition:Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+wJf5BEi8gQoXyfbhrpX6xqAzaaCJeyS4ky0XaRZrB8=; b=PRxYaESK+9mnBSr5Pw9fMI+q2f
	y0Q7nJgVru9abFQdhCiQNRZGSQtn56XDzNOXyoPoW3PhtL+0eA5KG+6O1jOQtzegPz+ECA5uNRi1t
	laIGWtgHHP4MnuAUE86ZTl/RUnkzl8Wdewr7vl/h095zhdXGfKwwU5sMBDI6vuWDl7oU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1mSKkM-007VY4-U9
	for tools@linux.kernel.org; Mon, 20 Sep 2021 16:58:18 +0200
Date: Mon, 20 Sep 2021 16:58:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: tools@linux.kernel.org
Subject: B4 thanks helper
Message-ID: <YUihigXZKZauguF0@lunn.ch>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin

In your LPC talk you said you were working on having B4 generate Thank
You's for when a patchset is merged.

patchwork already has something like this. Here is one from the netdev
list. The problem with this is that it is anonymous. You have no idea
who did the merge. With netdev, there are two maintainers, and other
subsystems have multiple maintainers.

Maybe this is not an issue for b4, if it is used within the MTA, not a
bot. But it would be nice if the generated text contained the
maintainers name doing the merge.

      Andrew

----- Forwarded message from patchwork-bot+netdevbpf@kernel.org -----

Date: Mon, 20 Sep 2021 09:10:07 +0000
From: patchwork-bot+netdevbpf@kernel.org
To: Michael Chan <michael.chan@broadcom.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, kuba@kernel.org, gospo@broadcom.com
Subject: Re: [PATCH net] bnxt_en: Fix TX timeout when TX ring size is set to the smallest
X-Spam-Status: No, score=-6.4 required=4.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI, RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 20 Sep 2021 02:51:52 -0400 you wrote:
> The smallest TX ring size we support must fit a TX SKB with MAX_SKB_FRAGS
> + 1.  Because the first TX BD for a packet is always a long TX BD, we
> need an extra TX BD to fit this packet.  Define BNXT_MIN_TX_DESC_CNT with
> this value to make this more clear.  The current code uses a minimum
> that is off by 1.  Fix it using this constant.
> 
> The tx_wake_thresh to determine when to wake up the TX queue is half the
> ring size but we must have at least BNXT_MIN_TX_DESC_CNT for the next
> packet which may have maximum fragments.  So the comparison of the
> available TX BDs with tx_wake_thresh should be >= instead of > in the
> current code.  Otherwise, at the smallest ring size, we will never wake
> up the TX queue and will cause TX timeout.
> 
> [...]

Here is the summary with links:
  - [net] bnxt_en: Fix TX timeout when TX ring size is set to the smallest
    https://git.kernel.org/netdev/net/c/5bed8b0704c9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



----- End forwarded message -----
