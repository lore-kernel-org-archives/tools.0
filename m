Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA58EC6
	for <tools@linux.kernel.org>; Tue, 29 Aug 2023 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693294698; x=1724830698;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=7xbIuAVv6BRYk1f4b+LCb+VtGRsblUZaWwZkr0s2oa0=;
  b=CSkx6qiqZk4IL3Yz8zktdjj8jbn0IXQfGY2b9gIzwn8vYAbF7yAABpOP
   BcCPFl5vjZRkDCOS4ydS1Jf0Ezntymj3zz01SljZYUc0rSCKKx47zanH0
   YCQ2w8bzWzeJM1PqUKMgo2Jw0jBudQZGmQoWOSeAwy5O4q1p4cJWcI55P
   GTDBQ+YZv+t7lO49RwFPBGTo1Y0sVxmRPVjPysnIT7Bg6bO1ZYqe7p4ac
   A1RUzU7uDcGjNgzxcjEr55OAHRqz9XXw+k4sRnjOX2z4KHakoyKRCy2Sn
   Wg3kzGbH1pc2GaIijrrS7STxDQT5uXkCudWop2TN7AmikwjNCJcyO3Ajo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375263858"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="375263858"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853178928"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="853178928"
Received: from mnefedov-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.32.206])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:38:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Guru Das
 Srinagesh <quic_gurus@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Kees Cook
 <keescook@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Will Deacon
 <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 quic_pkondeti@quicinc.com, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, workflows@vger.kernel.org, tools@linux.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/1] scripts: Add add-maintainer.py
In-Reply-To: <20230828165038.GB818859@hu-bjorande-lv.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1693037031.git.quic_gurus@quicinc.com>
 <141b9fcab2208ace3001df4fc10e3dfd42b9f5d9.1693037031.git.quic_gurus@quicinc.com>
 <87jztf37ny.fsf@intel.com>
 <20230828133554.GA818859@hu-bjorande-lv.qualcomm.com>
 <CAMuHMdU+3oj+-3=f5WFVTRsKQjqCpU8SnVqKSZGk8XRxhsDcVQ@mail.gmail.com>
 <9aec0740-2482-d3ad-caf2-5e6278a050b3@suse.cz>
 <89c73602-43f1-30a4-ad58-637aadacd653@linaro.org>
 <20230828165038.GB818859@hu-bjorande-lv.qualcomm.com>
Date: Tue, 29 Aug 2023 10:38:08 +0300
Message-ID: <87cyz62t9b.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> On Mon, Aug 28, 2023 at 05:23:58PM +0200, Krzysztof Kozlowski wrote:
>> On 28/08/2023 17:14, Vlastimil Babka wrote:
>> > On 8/28/23 15:48, Geert Uytterhoeven wrote:
>> >> Hi Bjorn,
>> >>
>> >> On Mon, Aug 28, 2023 at 3:37=E2=80=AFPM Bjorn Andersson
>> >> <quic_bjorande@quicinc.com> wrote:
>> >>> On Mon, Aug 28, 2023 at 11:14:41AM +0300, Jani Nikula wrote:
>> >>>> On Sat, 26 Aug 2023, Guru Das Srinagesh <quic_gurus@quicinc.com> wr=
ote:
>> >>>>> This script runs get_maintainer.py on a given patch file (or multi=
ple
>> >>>>> patch files) and adds its output to the patch file in place with t=
he
>> >>>>> appropriate email headers "To: " or "Cc: " as the case may be. The=
se new
>> >>>>> headers are added after the "From: " line in the patch.
>> >>>>
>> >>>> FWIW, I personally prefer tooling to operate on git branches and co=
mmits
>> >>>> than patches. For me, the patches are just an intermediate step in
>> >>>> getting the commits from my git branch to the mailing list. That's =
not
>> >>>> where I add the Cc's, but rather in the commits in my local branch,
>> >>>> where they're preserved. YMMV.
>> >>>>
>> >>>
>> >>> May I ask how you add/carry the recipients in a commit?
>> >>
>> >> I guess below a "---" line in the commit description?
>> >=20
>> > Does that do anything special in commit log? I'd expect (and I do it t=
hat
>> > way) it's rather just adding a
>>=20
>> It does. It goes away.
>
> Afaict, it's verbatim copied into the .patch, which would mean that it
> goes away when the patch is applied on the other side.
>
> But it's still going to be in the email (followed by another ---), so
> unless there's another step later in the process that cleans this up I
> it looks ugly, and not very useful - unless I'm missing something.
>
>> >=20
>> > Cc: Name <email>
>> >=20
>> > in the tag area where s-o-b, reviewed-by etc are added.
>>=20
>> Why storing autogenerated scripts/get_maintainer.pl CC-entries in commit
>> msg? The non-maintainer-output but the automated output? There is no
>> single need to store automated output of get_maintainers.pl in the git
>> log. It can be easily re-created at any given time, thus its presence in
>> the git history is redundant and obfuscates the log.
>>=20
>
> Fully agree to this. In particular if the patch is going to be sent as
> part of a series the recipients list won't be accurate for any patch.
>
> The case I was looking for was the case where I want to make sure to
> include a specific person, beyond the get_maintainers output. So pretty
> much the usual Cc: tag in the commit message, but I don't necessarily
> want to write this fact into the git history.

The point is, I *never* use get_maintainer.pl output as-is.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
