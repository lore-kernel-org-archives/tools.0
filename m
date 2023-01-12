Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC279EA
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 16:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C5BC433D2;
	Thu, 12 Jan 2023 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673540056;
	bh=GcCyTKB7MW2Tg1h2qAE+oIeFzaLdnpLnRgZPh6bvi60=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FdWlZahK4u89pMl99/+Qg76bSN6YD+o486ffmdjaMqIjCdzTB5hUbMQMePNbITQaw
	 jokquxb86RdKtZ+ARAOLXwuT+4MKbPFCWCCD5yVq0o70/qa4Ugu4RMi8ztooa1OYLk
	 drtfYVXwA7FRhK1Z34Ztal0KHJQHUBM2TXiYbCVY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
References: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
Subject: Re: [PATCH b4 0/2] A prep splat fix and rework of option handling
Message-Id: <167354005589.3235573.15636789811112266810.b4-ty@linuxfoundation.org>
Date: Thu, 12 Jan 2023 11:14:15 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-5b205


On Tue, 10 Jan 2023 15:46:07 -0600, Rob Herring wrote:
> I wanted enroll a branch and run 'auto-to-cc' in one step which from the
> help looks valid, but was met with a splat. The same splat happens if
> one runs 'b4 prep -c' on a newly created branch with no commits (other
> than the cover letter). There's a couple of other options that might be
> useful to use on new branches. The 2nd patch makes this possible.
> 
> Alternatively, the help should be clearer on what options are valid
> together or not.
> 
> [...]

Applied, thanks!

[1/2] prep: Fix splat with --auto-to-cc when a branch has no commits
      commit: d45b65977fc76558d9d69631a7047ccd33cce6ea
[2/2] prep: Allow configuration options when enrolling/creating branch
      commit: 5b2056d4002a1d71dc64c56ee65585c5d8739c32

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

