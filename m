Received: from sweaglesw.org (sweaglesw.org [216.129.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A172;
	Wed,  1 Sep 2021 01:30:06 +0000 (UTC)
Received: by sweaglesw.org (Postfix, from userid 1021)
	id AC6B860140; Tue, 31 Aug 2021 18:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=djwong.org; s=default;
	t=1630459390; bh=UC/cdFFBwNRR+dnf7PDf5oxfhpv7GkGK4Uxp05DDh0M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=I3hEK3njls116VZr1oXe3nILIVJ8RTTl5PrT5UkpdgTpMLNygavF2YzrCpE6AnGom
	 gUmlFmc2d/+dJKSsSmPO/Pxdbra/fYUv8oAZOOLyjtZvW/cOREAAu3AR+6/gr3/Y9y
	 VjVppFx9QhpNXVK1elDLwGN9r1JUojnQT0vXtuxy4f3wuCd2NgBf1Y1iPHqBSAnMVl
	 okEhDIexkr3aLmI/uqZ9ufzU4vWetDpbg4FGhrm6fjPRWnHj46h9GAxO5e+iMTZv5d
	 NydCcGyYGAgebDu3Z8qGKBIxeZdzFkNcHrfCWcNjYd97VvOpM8cs/DWpkmWJMlB22D
	 EmjMh6wF+geTmizh4B7T1UYBa8cAlPqPU/m5WJI+oR6KYfdAbayDVOXHRhysNm0nnx
	 xIXy9tD6ht0BrXGuUBdzqV2ZxgvbbJ/hN1YTq2oDlBLbMKojupyDLhEstEW1/Q/Tqg
	 FAL7mdVdzriRwtdanA0QxNkNak1+Wma7MwFEUiW4u2VvkElP/tZpyGWPemOLdo3TeD
	 aqrKRp0FV14bGZ7ntzPBJSMBr6uyY4ZPQPGISlu8t8eGT/jbmj4ykfZG5MxyaWoZPb
	 1gE4mPTGY4kXAV1S98Cu4oxZcJ3SVrvlc64ksC6N3HMicsPROGU+v4la8L9mWIw0eV
	 P03w8gh3bhARZ/V5jEwhsu9Q=
Date: Tue, 31 Aug 2021 18:23:10 -0700
From: "Darrick J. Wong" <djwong+korg@djwong.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210901012310.GL4159675@sweaglesw.org>
Reply-To: djwong@djwong.org
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830164626.tq5emfrht4o46x33@nitro.local>

On Mon, Aug 30, 2021 at 12:46:26PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> My tests of the new lore.kernel.org service (currently running on
> x-lore.kernel.org) are looking good, so I will be putting that into production
> on Wednesday, September 1, 2021.

Any chance I could persuade you to remove the color changes in the CSS
stylesheet?  The text colors on the new x-lore appear washed out to me
due to "color: #333;", which makes it harder to read.

I can hack around all that stylistic choice by adding more rules to my
bespoke browser extension that makes the web readable again for my old
eyes, but I'd prefer the current lore's stylesheet, which uses the user
agent's preferences.

Something like this, perhaps?

--D

css: use the user agent's text colors

Despite the comment for the color scheme claiming that "...bright colors
hurt my eyes", gray text on white strains /my/ old eyes because of the
unnecessarily low contrast.

Just use the user agent's text color, because users know best.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 contrib/css/216light.css | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/css/216light.css b/contrib/css/216light.css
index 741214c..9abdd16 100644
--- a/contrib/css/216light.css
+++ b/contrib/css/216light.css
@@ -4,7 +4,7 @@
  * Suitable for print, and blinding people with brightness.
  * Haphazardly thrown together because bright colors hurt my eyes
  */
-* { font-size: 100%; font-family: monospace; background:#fff; color:#333 }
+* { font-size: 100%; font-family: monospace; background:#fff; }
 pre { white-space: pre-wrap }
 
 /*
-- 
2.25.1
