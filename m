Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFA15BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 18:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93BAC433EF;
	Fri, 26 May 2023 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685125733;
	bh=45twkFwZJtyRIKiUku3m48vI2nZT7RG5Cto8XPpZ2F0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OFmM1uBjoAb/rFw3m1KSnU391R3B6xixeputUeFFoK2aBDF8juvXBxmjGwqKjXlGy
	 NlcZxFLB8Y26GpzIZSUw+t44ywCfE2qk4kQwtYjp+HCSk4+YNApcMUezV1moXJa0Oc
	 dKYUowBTFDM5tkL6NbOo+ocr466IcbohZSn5r9O8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
References: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
Subject: Re: [PATCH b4 0/2] am, shazam: allow cherry-picking an
 out-of-series patch
Message-Id: <168512573270.62751.10929456298761671390.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 14:28:52 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-02a79


On Sat, 15 Apr 2023 15:30:58 -0400, Philippe Blain wrote:
> This series makes am and shazam able to cherry-pick a patch sent by a reviewer
> as a suggestion (second patch). The first patch is a preparatory
> simplification.
> 
> If you want to test it, you can do so in a clone of git.git:
> 
>     git clone https://github.com/gitgitgadget/git -b pr-1515/phil-blain/doc-auto-merge-v1
>     git checkout 66c7e51415
>     b4 am -o- -P_ https://lore.kernel.org/git/ZDnCMegeiw0kT5oj@nand.local/
> 
> [...]

Applied, thanks!

[1/2] mbox.py::make_am: simplify check for early return
      commit: 6c9ad4ec28f9a14cd8d20c933eef7bce0285a60a
[2/2] am, shazam: allow cherry-picking an out-of-series patch
      commit: 5872a3cfbb27a8511ee8a07f2b1a5bc79163dcd6

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

