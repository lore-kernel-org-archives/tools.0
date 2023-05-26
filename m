Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293A915BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 17:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B41C433D2;
	Fri, 26 May 2023 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685123377;
	bh=pKuDn74lhkChpBrU0nAeJE/AMLUFYvNBVs8YzdvbIIs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bCU8/TVy6VSyTN9Jnrchq8SG74xUb0/eBbarMFZisduQqqMV8eZeomIL66bnrSZol
	 ucwFCNToZQfL11FIQHvEdkPOrgElGLVBSEishLR23F0K++Ru3i3WTo7tk+ILfV/9u6
	 MjAMHwdAKy4OI0HYDTtuDrI/Jg6LSZXYuBRmcwlo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>
In-Reply-To: <20230517-allow-new-w-fork-point-v1-1-22d2cb938e16@intel.com>
References: <20230517-allow-new-w-fork-point-v1-1-22d2cb938e16@intel.com>
Subject: Re: [PATCH b4] b4: Allow prep new branch while on a b4 managed
 branch
Message-Id: <168512337743.1382809.12230402232248672587.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 13:49:37 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-229b7


On Wed, 17 May 2023 11:56:38 -0700, Ira Weiny wrote:
> Creating a new branch from a specified fork point should be allowed when
> sitting on a b4 managed branch.  For example this fails:
> 
> 	$ b4 prep -n foo -f master
> 	Created new branch b4/foo
> 	Created the default cover letter, you can edit with --edit-cover.
> 
> [...]

Applied, thanks!

[1/1] b4: Allow prep new branch while on a b4 managed branch
      commit: 229b766fdd3b9d5561e76a5cf569aa946dcc2ef0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

