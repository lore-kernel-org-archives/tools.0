Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3F808
	for <tools@linux.kernel.org>; Tue, 29 Nov 2022 18:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF20C433C1;
	Tue, 29 Nov 2022 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669747335;
	bh=tQHPuywD0WKG8aDihVuSWtvXOiiBmCOQD1MyMZH24U0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PwGy+DB5VJhZrTCSoBXY6ANsWpGweSD2ETzgVhBfXSKlyJpYj/MxjfX6pmTLTA4tj
	 fMrv62xJcpI/Ekb0xVzzTAEVRQV6vx7JSdH+QJM8aqaZbw9+NingRBtqqQR6xkNv/a
	 V2syEAxXyK9O70U/SPVJ2gP8mBeCeN1lOkP87LDM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
In-Reply-To: <20221107134054.75514-1-levraiphilippeblain@gmail.com>
References: <20221031195132.bnezxkjboseihynx@meerkat.local>
 <20221107134054.75514-1-levraiphilippeblain@gmail.com>
Subject: Re: [PATCH b4] Fix 'LoreSeries::make_fake_am_range' with renamed,
 then modified file
Message-Id:
 <166974733534.181387.13494072343779576172.b4-ty@linuxfoundation.org>
Date: Tue, 29 Nov 2022 13:42:15 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-10cab

On Mon, 07 Nov 2022 08:40:54 -0500, Philippe Blain wrote:
> When invoking 'b4 diff', LoreSeries::make_fake_am_range is used to
> create the old and new versions of a series in a temporary worktree.
> 
> The code is currently unprepared for a series that renames a file
> and then modifies it in a subsequent commit.
> 
> The first issue is that LoreMessage::get_indexes fails to set
> blob_indexes for a renamed file since the 'diff --git' header for such a
> change has different file names for the "old" and "new" file, but that
> function skips any diff where "old" and "new" do not match. Fix that by
> removing that condition.
> 
> [...]

Applied, thanks!

[1/1] Fix 'LoreSeries::make_fake_am_range' with renamed, then modified file
      commit: 10cabf05b0404f7a87522180750d003985211814

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
